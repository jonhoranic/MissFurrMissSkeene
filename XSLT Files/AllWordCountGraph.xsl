<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    
<!--VARIABLE SET-->
        <xsl:variable name="rep" select="//repTerm"/>
        <xsl:variable name="normRep" select="$rep/lower-case(normalize-space())"/>
        <xsl:variable name="distRep" select="distinct-values($normRep)"/>
        
        <xsl:variable name="one" select="//oneTerm"/>
        <xsl:variable name="normOne" select="$one/lower-case(normalize-space())"/>
        
        <xsl:variable name="hono" select="//hono"/>
        <xsl:variable name="distHono" select="distinct-values($hono)"/>
        
        <xsl:variable name="firstN" select="//firstname"/>
        <xsl:variable name="distFirstN" select="distinct-values($firstN)"/>
        
        <xsl:variable name="lastN" select="//lastname"/>
        <xsl:variable name="distLastN" select="distinct-values($lastN)"/>
    
    <xsl:template match="/">
      <xsl:variable name="tree" select="current()"/>
      <xsl:for-each select="$distRep">
          <xsl:value-of select="concat(current(), count($tree//repTerm[. = current()]))"/>
      </xsl:for-each>
        
        <!--<svg width="1000" height="1000" viewBox="0 0 1000 1000">
            <g transform="translate(0 500)">
            </g>  
        </svg>-->  
        
    </xsl:template>
    
   
    
</xsl:stylesheet>