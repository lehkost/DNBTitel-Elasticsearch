<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:dc="http://purl.org/dc/elements/1.1/" 
xmlns:geo="http://www.opengis.net/ont/geosparql#" 
xmlns:foaf="http://xmlns.com/foaf/0.1/" 
xmlns:sf="http://www.opengis.net/ont/sf#" 
xmlns:isbd="http://iflastandards.info/ns/isbd/elements/" 
xmlns:gndo="http://d-nb.info/standards/elementset/gnd#" 
xmlns:dcterms="http://purl.org/dc/terms/" 
xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" 
xmlns:marcRole="http://id.loc.gov/vocabulary/relators/"
xmlns:lib="http://purl.org/library/" 
xmlns:umbel="http://umbel.org/umbel#" 
xmlns:rdau="http://rdaregistry.info/Elements/u/" 
xmlns:bibo="http://purl.org/ontology/bibo/" 
xmlns:owl="http://www.w3.org/2002/07/owl#" 
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
xmlns:skos="http://www.w3.org/2004/02/skos/core#"    
exclude-result-prefixes="xs"
version="1.0">
    
<xsl:output method="text" indent="yes" encoding="UTF-8"/>
    
<xsl:template match="/">      
<xsl:for-each select="//rdf:Description">   
{"index":{"_id":"<xsl:value-of select="substring(./@rdf:about, 18)"/>"}}
<xsl:variable name="step1">
{
"dnb-id": "<xsl:value-of select="./@rdf:about"/>",
"type": "<xsl:value-of select="./rdf:type/@rdf:resource"/>",
"medium": "<xsl:value-of select="./dcterms:medium/@rdf:resource"/>",
"lang": "<xsl:value-of select="./dcterms:language/@rdf:resource"/>",
"creator": [ <xsl:for-each select="./dcterms:creator">"<xsl:value-of select="./@rdf:resource"/>",</xsl:for-each>],
"contributor": [ <xsl:for-each select="./dcterms:contributor">"<xsl:value-of select="./@rdf:resource"/>",</xsl:for-each>],
"date": "<xsl:value-of select="./dcterms:issued"/>",
"date_norm": "<xsl:value-of select="replace(./dcterms:issued, '^(\d\d\d\d).*', '$1')"/>",
"title": "<xsl:value-of select="./dc:title"/>",
"short_title": "<xsl:value-of select="./bibo:shortTitle"/>",
"place": [ <xsl:for-each select="./rdau:P60163">"<xsl:value-of select="."/>",</xsl:for-each>],
"pages": "<xsl:value-of select="./isbd:P1053"/>",
<xsl:if test="contains(./isbd:P1053, ' S.')">"pages_norm": <xsl:value-of select="replace(./isbd:P1053, '(\d+) S\..*', '$1')"/>,</xsl:if>
"extent": "<xsl:value-of select="./dcterms:extent"/>",
<xsl:if test="contains(./dcterms:extent, ' S.')">"extent_norm": <xsl:value-of select="replace(./dcterms:extent, '(\d+) S\..*', '$1')"/>,</xsl:if>
"publisher": "<xsl:value-of select="./dc:publisher"/>",
"place_publisher_year": "<xsl:value-of select="rdau:P60333"/>",
"subject": [ <xsl:for-each select="./dcterms:subject">"<xsl:value-of select="./@rdf:resource"/>",</xsl:for-each>],
"price": "<xsl:value-of select="rdau:P60001"/>"
}
</xsl:variable>
<xsl:variable name="step2">
    <xsl:value-of select="replace($step1, ',\]', ' ]')"/>
</xsl:variable>
<xsl:value-of select="replace($step2, '\n', '')"/>
</xsl:for-each>

</xsl:template>
</xsl:stylesheet>