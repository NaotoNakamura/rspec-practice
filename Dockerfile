FROM ruby:2.7.4

#apt-keyとdevconfのエラー対策
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV DEBCONF_NOWARNINGS=yes

# node.jsと必要なライブラリのインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client \
            curl apt-transport-https wget imagemagick

# yarnのインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
      apt-get update && apt-get install -y yarn

#aptキャッシュの削除
RUN rm -rf /var/lib/apt/lists/*

# ディレクトリ・ファイルの作成
RUN mkdir /rspec-practice
WORKDIR /rspec-practice
COPY Gemfile /rspec-practice/Gemfile
COPY Gemfile.lock /rspec-practice/Gemfile.lock

# gem(Rails6)のインストール
RUN bundle install
COPY . /rspec-practice

RUN yarn install --check-files
RUN bundle exec rails webpacker:compile

# コンテナ起動時に毎回実行するスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# rails起動コマンド
CMD ["rails", "server", "-b", "0.0.0.0"]