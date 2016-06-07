repo = xihh
name = surpi
version = v1.0.18.r30.b817022.v7

SHELL=sh
EDITOR=vis-git
DEPENDS=abyss amos bioplayground blast+ fastqvalidator fqextract genometools jdk7-openjdk mummer prinseq-lite python2-cutadapt rapsearch seqtk snap-dna sra-tools openmpi perl-dbd-sqlite pigz trimmomatic
OPTS=sshfs 9base
TARGET=surpi-git

build:V: surpi.tar.gz
	docker build -t $repo/$name:$version .
	docker tag $repo/$name:$version $repo/$name:latest

push:V:
	docker push $repo/$name:$version

chroot:
	mkdir -p ./chroot/var/lib/pacman/
	sudo pacman -Syu --noconfirm -r ./chroot --config ./pacman.conf base $SHELL $EDITOR $TARGET $DEPENDS $OPTS

surpi.tar.gz: chroot
	test -d chroot || mk chroot
	cd chroot &&
	sudo bsdtar -cf ../surpi.tar.gz ./ &&
	cd .. &&
	sudo chown $USER surpi.tar.gz

%/:
	mkdir -p $stem

run:V:
	sh -c "docker run -t -i $repo/$name /bin/sh"

clean:V:
	sudo rm -r ./chroot || true
	rm surpi.tar.gz
