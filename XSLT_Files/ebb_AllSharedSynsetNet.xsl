<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

<xsl:output method="text"/>
    
<xsl:variable name="steinDoc" select="document('../XML_Files/SteinMarkUp.xml')/*"/>   
    
    <xsl:template match="/">
        
        <xsl:apply-templates select="//word"/>
    </xsl:template>
    
    <xsl:template match="word">
     <xsl:variable name="sourceWord" select="w"/>
       <xsl:variable name="countInStein">
       <xsl:value-of select="count($steinDoc//*[./lower-case(normalize-space()) = $sourceWord])"/>
       </xsl:variable>
           
 
      <xsl:for-each select="descendant::lemma">
       <xsl:variable name="pos" select="tokenize(current(), '\.')[2]"/>
        <xsl:variable name="synWord" select="//word[descendant::lemma = current()]/w[not(. = $sourceWord)]"/>
        <xsl:for-each select="$synWord">
            <xsl:variable name="countSynStein"><xsl:value-of select="count($steinDoc//*[./lower-case(normalize-space()) = $synWord])"/>
            </xsl:variable>
            <xsl:value-of select="concat($sourceWord, '&#x9;', $countInStein, '&#x9;', $pos, '&#x9;', current(), '&#x9;', $countSynStein, '&#10;')"/>      
        </xsl:for-each>
    </xsl:for-each>
         

        
    </xsl:template>
    
</xsl:stylesheet>