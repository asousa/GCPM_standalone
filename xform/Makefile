.SUFFIXES : .for .mod .for

# Which fortran compiler to use
# G95 = gfortran
# Where to put the compiled library (libxformd.a)
ODIR = .

ifeq "$(OS)" "Windows_NT"
RM = del
else
RM = rm -f
endif

sources = \
	Cart_to_pol.for \
	GEI_TO_GSM.for \
	GEI_TO_MAG.for \
	GEI_TO_SM.for \
	GEO_TO_GEI.for \
	GEO_TO_GSE.for \
	GEO_TO_GSM.for \
	GEO_TO_MAG.for \
	GEO_TO_SM.for \
	GSE_TO_GEI.for \
	GSE_TO_GEO.for \
	GSE_TO_GSM.for \
	GSE_TO_MAG.for \
	GSE_TO_SM.for \
	GSM_TO_GEI.for \
	GSM_TO_GEO.for \
	GSM_TO_GSE.for \
	GSM_TO_SM.for \
	GSM_TO_MAG.for \
	Gei_TO_gse.for \
	Gei_to_geo.for \
	Get_q_c.for \
	MAG_TO_GEI.for \
	MAG_TO_GEO.for \
	MAG_TO_GSE.for \
	MAG_TO_GSM.for \
	MAG_TO_SM.for \
	POL_TO_CART.for \
	Rotate_x.for \
	Rotate_y.for \
	Rotate_z.for \
	SM_TO_GEI.for \
	SM_TO_GEO.for \
	SM_TO_GSE.for \
	SM_TO_GSM.for \
	SM_TO_MAG.for \
	T0.for \
	T1.for \
	T2.for \
	T3.for \
	T4.for \
	T5.for

# FLAGS = -O3

OBJECTS = ${sources:.for=.o}

all: libxformd.a

clean:
	${RM} *.o
	${RM} *.mod
	${RM} *.a
	${RM} $(ODIR)/libxform.a

libxformd.a: ${OBJECTS}
	# Make static library
	ar rc libxform.a ${OBJECTS}
	# cp libxform.a $(ODIR)

shared:
	# Make shared library
	${fcompiler} ${FLAGS} -shared ${sources} -o libxform.so

	

.for.o:
	${fcompiler} ${FLAGS} -c $<

%.o : %.mod  
