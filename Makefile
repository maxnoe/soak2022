all: images


images: build/gaias_sky_in_color.jpg build/hertzsprung_russel.png build/crab.jpg
images: build/stars.png build/core_collapse.png build/sonnen_aufbau.png
images: build/sonne.jpg build/gaia_sun_evolution.mp4 build/stellar_evolution.jpg
images: build/hauptreihe.png build/alma_planetary_disk.jpg build/carina_visible_ir.jpg
images: build/jwst_carina.jpg build/hubble_carina.jpg



dl=curl -sSfL -o $@

build/gaias_sky_in_color.png: | build
	${dl} 'https://cdn.sci.esa.int/documents/33580/35361/1567215029635-ESA_Gaia_DR2_AllSky_Brightness_Colour_8000x4000_transparent.png/cc5012fa-0050-840e-ad5d-f987f0182b18?version=1.0&t=1567215056928'

build/hertzsprung_russel.png: | build
	${dl} https://scienceblogs.de/astrodicticum-simplex/files/2012/06/17882-HRD04.png

build/stars.png: | build
	${dl} https://upload.wikimedia.org/wikipedia/commons/6/69/Well_known_stars_2.png

build/gaia_sun_evolution.mp4: | build
	${dl} https://dlmultimedia.esa.int/download/public/videos/2022/08/002/orig-2208_002_AR_EN.mp4

build/core_collapse.png: | build
	${dl} https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Evolved_star_fusion_shells.svg/1024px-Evolved_star_fusion_shells.svg.png

build/sonne.jpg: | build
	${dl} https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/The_Sun_by_the_Atmospheric_Imaging_Assembly_of_NASA%27s_Solar_Dynamics_Observatory_-_20100819-02.jpg/1073px-The_Sun_by_the_Atmospheric_Imaging_Assembly_of_NASA%27s_Solar_Dynamics_Observatory_-_20100819-02.jpg

build/stellar_evolution.jpg: | build
	${dl} https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Star_Life_Cycle_Chart.jpg/2560px-Star_Life_Cycle_Chart.jpg

build/sonnen_aufbau.png: | build
	${dl} https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Solar_internal_structure-de.svg/1024px-Solar_internal_structure-de.svg.png

build/hauptreihe.png: | build
	${dl} https://upload.wikimedia.org/wikipedia/commons/e/ef/Zams_and_tracks.png


build/%.jpg: build/%.png
	convert $< $@

build/crab.jpg: | build
	${dl} https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Crab_Nebula.jpg/2048px-Crab_Nebula.jpg

build/alma_planetary_disk.jpg: | build
	${dl} https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/HL_Tau_protoplanetary_disk.jpg/1024px-HL_Tau_protoplanetary_disk.jpg

build/carina_visible_ir.jpg: | build
	${dl} https://cdn.spacetelescope.org/archives/images/large/heic1007b.jpg

build/jwst_carina.png: | build
	${dl} https://stsci-opo.org/STScI-01GA6KKWG229B16K4Q38CH3BXS.png

build/hubble_carina.jpg: | build
	${dl} https://cdn.spacetelescope.org/archives/images/large/opo0834a.jpg

build:
	mkdir -p build

clean:
	rm -rf build

build/fontawesome/css/all.css: | build
	rm -rf build/fontawesome
	curl -sSfL -o build/fontawesome.zip https://use.fontawesome.com/releases/v6.2.0/fontawesome-free-6.2.0-web.zip
	unzip build/fontawesome.zip -d build
	mv build/fontawesome-* build/fontawesome
	rm -f build/fontawesome.zip



.PHONY: images
