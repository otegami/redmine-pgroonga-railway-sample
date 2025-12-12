FROM alpine/git:latest AS plugin

RUN git clone --depth=1 https://github.com/clear-code/redmine_full_text_search.git /full_text_search

FROM redmine:6.1

COPY --from=plugin /full_text_search /usr/src/redmine/plugins/full_text_search
