repo = csb-ig
name = surpi
version = v1.0.18.r30.b817022

SHELL=busybox
OPTDEPENDS=abyss amos bioplayground blast+ fastqvalidator fqextract genometools jdk7-openjdk mummer prinseq-lite python2-cutadapt rapsearch seqtk snap-dna
TARGET=surpi-git

build:V: surpi.tar.gz
	docker build -t $repo/$name .

chroot:
	mkdir -p ./chroot/var/lib/pacman/
	sudo pacman -Syu --noconfirm -r ./chroot $SHELL $TARGET $OPTDEPENDS

surpi.tar.gz:
	test -d chroot || make chroot
	cd chroot &&
	sudo bsdtar -cf ../surpi.tar.gz ./ &&
	cd .. &&
	sudo chown $USER surpi.tar.gz &&
	sudo rm -r chroot

%/:
	mkdir -p $stem

run:V:
	sh -c "docker run -t -i $repo/$name /bin/sh"

clean:V:
	sudo rm -r ./chroot
	rm surpi.tar.gz
