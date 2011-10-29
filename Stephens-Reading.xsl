<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 29, 2011</xd:p>
            <xd:p><xd:b>Author:</xd:b> lulman</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Include common style sheet for Stephens family letters. -->
    
    <xsl:include href="Stephens-Common.xsl"/>
    
    <!-- Define templates required for the reading view. -->
    
    <xsl:template match="tei:pb"/>
    <xsl:template match="tei:lb"/>
    <xsl:template match="tei:div[@type='letter']/tei:head/tei:lb">
        <br/><xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:opener/tei:lb">
        <br/><xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:closer/tei:lb">
        <br/><xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:seg[@type='softhyphen']"/>
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
</xsl:stylesheet>