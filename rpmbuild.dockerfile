FROM rockylinux/rockylinux:8

RUN dnf update -y
RUN dnf install -y epel-release dnf-utils rpmdevtools rpmlint wget
RUN dnf groupinstall -y 'Development Tools'


RUN adduser rpmbuild

RUN mkdir -p /home/rpmbuild/meilisearch-packaging
RUN chown rpmbuild.rpmbuild /home/rpmbuild

USER rpmbuild

WORKDIR /home/rpmbuild

ENTRYPOINT [ "/bin/bash", "/home/rpmbuild/meilisearch-packaging/build.sh" ]
