{ pkgs, ... }:
pkgs.writeShellScriptBin "kmerge" ''
	umask 0177
	KUBECONFIG=$1:~/.kube/config kubectl config view --merge --flatten > ~/.kube/merge.tmp
	mv ~/.kube/config ~/.kube/config-$(date +%Y%m%d-%H%M)
	mv ~/.kube/merge.tmp ~/.kube/config
	umask 022
''
