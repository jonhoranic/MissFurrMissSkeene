<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text" indent="yes"/>
    
    <!--VARIABLE SET-->
    <xsl:variable name="rep" select="//repTerm"/>
    <xsl:variable name="normRep" select="$rep/lower-case(normalize-space())"/>
    
    <xsl:variable name="words" select="distinct-values($normRep)"/>
    
    <xsl:template match="/">
        <xsl:for-each select="$words">
            <xsl:sort/>
            <xsl:value-of select="concat(., '&#x0a;')"/>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>