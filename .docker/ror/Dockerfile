FROM ruby:2.7

# Register Yarn package source.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install additional packages.
RUN apt update -qq
RUN apt install -y postgresql-client nodejs yarn
# RUN apt install -y clamav clamav-daemon
# RUN freshclam
# RUN service clamav-freshclam start
# RUN service clamav-daemon stop
# RUN service clamav-daemon start

# Prepare working directory.
WORKDIR /ror
COPY ./ror /ror
RUN gem install bundler
RUN bundle install

# Save rails console and irb history
RUN echo 'IRB.conf[:SAVE_HISTORY] = 10000' > /root/.irbrc

# Symlink important files so they remain across docker restarts
RUN ln -s ~/host/.irb_history ~/
RUN ln -s ~/host/.bash_history ~/

# Configure endpoint.
COPY ./.docker/ror/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start app server.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
