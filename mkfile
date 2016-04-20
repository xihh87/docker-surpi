repo = csb-ig
name = surpi
version = v1.0.18.r30.b817022

SHELL=busybox
OPTDEPENDS=abyss amos bioplayground blast+ fastqvalidator fqextract genometools jdk7-openjdk mummer prinseq-lite python2-cutadapt rapsearch seqtk snap-dna
TARGET=surpi-git

build:V:
	docker build -t $repo/$name .

chroot: ./chroot/var/lib/pacman/
	sudo pacman -Sy --noconfirm -r ./chroot $SHELL $TARGET $OPTDEPENDS

%/:
	mkdir -p $stem

run:V:
	sh -c "docker run -t -i $name /bin/sh"
