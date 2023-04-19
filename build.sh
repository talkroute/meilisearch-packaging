#!/bin/bash

MEILISEARCHVERSION="1.1.1"

set -e

cd ~
rm -rf ~/rpmbuild
rpmdev-setuptree


wget -O ~/meilisearch-linux-amd64 https://github.com/meilisearch/meilisearch/releases/download/v${MEILISEARCHVERSION}/meilisearch-linux-amd64

cp ~/meilisearch-linux-amd64 ~/rpmbuild/SOURCES
cp ~/meilisearch-packaging/config.toml ~/rpmbuild/SOURCES
cp ~/meilisearch-packaging/meilisearch.service ~/rpmbuild/SOURCES
cp ~/meilisearch-packaging/meilisearch.spec ~/rpmbuild/SPECS/
rpmbuild -ba ~/rpmbuild/SPECS/meilisearch.spec

cp -r ~/rpmbuild/RPMS/* ~/meilisearch-packaging/rpms
