# Root-directory  
RM = rm -f



export fcompiler=gfortran

LIBS = -Lgcpm -lgcpm -Lxform -lxform -Liri2007 -liri
# LIBS = -Lxform -lxform 


# Use the -fstatic option with g95.  With gfortran, use -fno-automatic

ifeq "$(fcompiler)" "g95"
export FLAGS = -g -Wall -fstatic -ffixed-line-length-132 -ffree-line-length-huge -fno-second-underscore
endif
ifeq "$(fcompiler)" "gfortran"
export FLAGS = -g -Wall -fno-automatic -ffixed-line-length-132 -ffree-line-length-132 -fd-lines-as-code -finit-local-zero 
endif



_gcpm_sources = \
	bulge.for \
	gcpm_v24.for \
	iri_ps_bridge.for \
	iri_ps_eq_bridge.for \
	iri_sm.for \
	ne_inner_ps_trough.for \
	ne_iri_cap.for \
	ne_iri_ps_trough.for \
	ne_iri_ps_trough_eq.for \
	pp_profile.for \
	switchon.for
gcpm_sources = $(patsubst %,gcpm/%,$(_gcpm_sources))
gcpm_objects = ${gcpm_sources:.for=.o}

_xform_sources = \
	GEI_TO_GSM.for \
	GEO_TO_GEI.for \
	GEO_TO_MAG.for \
	GSE_TO_GEO.for \
	GSE_TO_SM.for \
	GSM_TO_GSE.for \
	MAG_TO_GEI.for \
	MAG_TO_GSM.for \
	SM_TO_GEI.for \
	SM_TO_GSM.for \
	GEI_TO_MAG.for \
	GEO_TO_GSE.for \
	GEO_TO_SM.for \
	GSE_TO_GSM.for \
	GSM_TO_GEI.for \
	GSM_TO_MAG.for \
	MAG_TO_GEO.for \
	MAG_TO_SM.for \
	SM_TO_GEO.for \
	SM_TO_MAG.for \
	GEI_TO_SM.for \
	GEO_TO_GSM.for \
	GSE_TO_GEI.for \
	GSE_TO_MAG.for \
	GSM_TO_GEO.for \
	GSM_TO_SM.for \
	MAG_TO_GSE.for \
	POL_TO_CART.for \
	SM_TO_GSE.for \
	Cart_to_pol.for \
	Gei_to_geo.for \
	Gei_TO_gse.for \
	Get_q_c.for \
	Rotate_x.for \
	Rotate_y.for \
	Rotate_z.for \
	T0.for \
	T1.for \
	T2.for \
	T3.for \
	T4.for \
	T5.for
xform_sources = $(patsubst %,xform/%,$(_xform_sources))
xform_objects = ${xform_sources:.for=.o}

_iri_sources = \
	cira.for \
	igrf.for \
	iridreg.for \
	irifun.for \
	irisub.for \
	iritec.for

	# iritest.for
iri_sources = $(patsubst %,iri2007/%,$(_iri_sources))
iri_objects = ${iri_sources:.for=.o}

all:
	$(MAKE) -C xform
	$(MAKE) -C iri2007
	$(MAKE) -C gcpm

clean:
	$(MAKE) -C xform clean
	$(MAKE) -C iri2007 clean
	$(MAKE) -C gcpm clean



shared:
	g++ ${FLAGS} -shared ${xform_sources} iri2007/igrf.for -o libgcpm.so -fPIC -whole-archive -lgfortran


test: 
	${fcompiler} test_gcpm.f95 ${LIBS} -o bin/test_gcpm
	cp iri2007/dgrf* bin
	cp iri2007/ursi* bin
	cp iri2007/ccir* bin

	# ${fcompiler} test_gcpm.f95 ${gcpm_objects} ${iri_objects} ${xform_objects} -o test_gcpm


	# $(MAKE) -C gcpm shared
	# mv gcpm/libgcpm.so .


