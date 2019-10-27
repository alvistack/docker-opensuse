# (c) Wong Hoi Sing Edison <hswong3i@pantarei-design.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM opensuse/leap:15.1

ENV LANG   "en_US.utf8"
ENV LC_ALL "en_US.utf8"
ENV SHELL  "/bin/bash"
ENV TZ     "UTC"

VOLUME  "/root"
WORKDIR "/root"

EXPOSE 22

ENTRYPOINT [ "dumb-init", "--", "docker-entrypoint.sh" ]
CMD        [ "/usr/sbin/sshd", "-eD" ]

# Hotfix for CVE-2019-5021
RUN sed -i -e 's/^root::/root:*:/' /etc/shadow

# Prepare Zypper dependencies
RUN set -ex \
    && zypper -n --gpg-auto-import-keys refresh \
    && zypper -n install -y ca-certificates* curl gcc git libffi-devel libopenssl-devel lsb-release make python3 python3-devel python3-xml sudo \
    && zypper clean --all

# Install PIP
RUN set -ex \
    && curl -skL https://bootstrap.pypa.io/get-pip.py | python3

# Copy files
COPY files /

# Bootstrap with Ansible
RUN set -ex \
    && cd /etc/ansible/roles/localhost \
    && pip3 install --upgrade --ignore-installed --requirement requirements.txt \
    && molecule dependency \
    && molecule lint \
    && molecule syntax \
    && molecule converge \
    && molecule verify \
    && rm -rf /var/cache/ansible/* \
    && rm -rf /root/.cache/* \
    && rm -rf /tmp/* \
    && zypper clean --all
