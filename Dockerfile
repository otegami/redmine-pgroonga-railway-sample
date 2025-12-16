# Copyright (C) 2025  Kodama Takuya <otegami@clear-code.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, see <https://www.gnu.org/licenses/>.

FROM redmine:6.1

RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential git \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 https://github.com/clear-code/redmine_full_text_search.git plugins/full_text_search

RUN rm -rf plugins/full_text_search/.git \
  && apt-get purge -y git \
  && apt-get autoremove -y
