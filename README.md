# GCPM_standalone
A standalone version of the GCPM plasmasphere / magnetosphere model, version 2.4. Includes some code cleanup, a speed boost for the IRI model, and a Makefile.

<ul>
<li>The science within here is completely the work of Gallagher et al -- https://plasmasphere.nasa.gov/models/
<li>Also included is the IRI 2007 model -- http://ccmc.gsfc.nasa.gov/modelweb/ionos/iri.html
<li>The IRI model is patched with the updated IGRF-12 magnetic field model -- https://www.ngdc.noaa.gov/IAGA/vmod/igrf.html, which eliminates a ton of file loading for a massive speed boost.
</ul>
