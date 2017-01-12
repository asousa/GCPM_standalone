.SUFFIXES : .f95 .mod .for .FOR

ifeq "$(OS)" "Windows_NT"
RM = del
else
RM = rm -f
endif


LIBS = -L../xform -lxform -L../iri2007 -liri


# export fcompiler = gfortran
sources = \
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

# # Use the -fstatic option with g95.  With gfortran, use -fno-automatic
# FLAGS = -O3 -Wall
# ifeq "$(fcompiler)" "g95"
# FLAGS += -fstatic -ffixed-line-length-132 -ffree-line-length-huge
# endif
# ifeq "$(fcompiler)" "gfortran"
# FLAGS += -fno-automatic -ffixed-line-length-132 -ffree-line-length-132 -fbackslash -fd-lines-as-comments -std=legacy 
# endif

OBJECTS = ${sources:.for=.o}

all: libgcpm.a

clean:
	${RM} *.o
	${RM} *.mod
	${RM} *.a

libgcpm.a: ${OBJECTS}
	ar rc libgcpm.a ${OBJECTS}

test: ${OBJECTS}
	${fcompiler} ${LIBS} ${FLAGS} test2D_gcpm_V24_meridianal_slice.for ${OBJECTS} -o test


.for.o:
	${fcompiler} ${FLAGS} -c $<

shared:
	${fcompiler} ${FLAGS} ${LIBS} -shared ${OBJECTS} -o libgcpm.so -fPIC --whole-archive

%.o : %.mod  
