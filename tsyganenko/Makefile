.SUFFIXES : .f95 .mod .for .for

ifeq "$(OS)" "Windows_NT"
RM = del
else
RM = rm -f
endif

sources = \
	TS05_aka_TS04.for \
	geopack2005.for

# Use the -fstatic option with g95.  With gfortran, use -fno-automatic
ifeq "$(G95)" "g95"
FLAGS = -O3 -Wall -fstatic
endif
ifeq "$(G95)" "gfortran"
FLAGS = -O3 -Wall -fno-automatic
endif

OBJECTS = TS05_aka_TS04.o geopack2005.o

all: libtsy.a

clean:
	${RM} *.o
	${RM} *.mod
	${RM} *.a

libtsy.a: ${OBJECTS}
	ar rc libtsy.a ${OBJECTS}

.for.o:
	${fcompiler} ${FLAGS} -c $<

.f95.o:
	${fcompiler} ${FLAGS} -c $<

%.o : %.mod  
