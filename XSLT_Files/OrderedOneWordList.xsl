<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text" indent="yes"/>
    
    <!--VARIABLE SET-->
    <xsl:variable name="one" select="//oneTerm"/>
    <xsl:variable name="normOne" select="$one/lower-case(normalize-space())"/>
    
    <xsl:variable name="words" select="$normOne"/>
    
    <xsl:template match="/">
        <xsl:for-each select="$words">
            <xsl:sort/>
            <xsl:value-of select="concat(., '&#x0a;')"/>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>