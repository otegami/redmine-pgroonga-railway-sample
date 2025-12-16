FROM redmine:6.1

RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential git \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://github.com/clear-code/redmine_full_text_search.git plugins/full_text_search

RUN rm -rf plugins/full_text_search/.git \
  && apt-get purge -y git \
  && apt-get autoremove -y
