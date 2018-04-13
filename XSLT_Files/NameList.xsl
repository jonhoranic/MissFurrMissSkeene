<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" indent="yes"/>
    
    <!--JMH: These two blocks will not run together, so one must remain commented
        out. To swtich between blocks, toggle the comment tag on/off when testing. -->
    
    <xsl:template match="/">
        <xsl:apply-templates select="//p//persName"/>
    </xsl:template>
    <xsl:template match="persName">
        <xsl:value-of select="concat(.,'&#x0a;')"/>
    </xsl:template>
    
    <!--<xsl:template match="/">
        <xsl:apply-templates select="//p//persName/hono"/>
    </xsl:template>
    <xsl:template match="hono">
        <xsl:value-of select="concat(.,'&#x0a;')"/>
    </xsl:template>-->
    
</xsl:stylesheet>