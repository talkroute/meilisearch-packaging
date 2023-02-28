Name:           meilisearch
Version:        1.0.2
Release:        1%{?dist}
Summary:        A lightning-fast search engine that fits effortlessly into your apps, websites, and workflow

License:        MIT
URL:            https://github.com/meilisearch/meilisearch
Source0:        https://github.com/meilisearch/meilisearch/releases/download/v%{version}/meilisearch-linux-amd64
Source1:        meilisearch.service
Source2:        config.toml

%description
Meilisearch helps you shape a delightful search experience in a snap,
offering features that work out-of-the-box to speed up your workflow.

%install
mkdir -p %{buildroot}%{_sharedstatedir}/%{name}
install -D -p %{SOURCE0} %{buildroot}%{_sbindir}/%{name}
install -D -p %{SOURCE1} %{buildroot}%{_unitdir}/%{name}.service
install -D -p %{SOURCE2} %{buildroot}%{_sysconfdir}/%{name}/config.toml

%files
%attr(755,root,root) %{_sbindir}/%{name}
%attr(0644,root,root) %{_unitdir}/%{name}.service 
%attr(0755,meilisearch,meilisearch) %{_sharedstatedir}/%{name}*
%config(noreplace) %{_sysconfdir}/%{name}/config.toml


%pre
%{_sbindir}/groupadd -r meilisearch &>/dev/null || :
%{_sbindir}/useradd  -r -s /sbin/meilisearch -d /var/lib/meilisearch -M \
                               -c 'Meilisearch User' -g meilisearch meilisearch &>/dev/null || :

%post
if [ $1 -eq 1 ] ; then
	/bin/systemctl daemon-reload >/dev/null 2>&1 || :
fi


%changelog
* Thu Feb 09 2023 Eric Howey <ehowey@talkroute.com>
- 
