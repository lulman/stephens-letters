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
    
    <!-- Declare variables that will "localize" references to them in Stephens-Common.xsl -->

    <xsl:variable name="aboutView">
        Each letter. . . . Line breaks in
        the manuscript are not reported; rather, lines wrap in the browser's window. Page
        breaks are not reported. Paragraph breaks follow those in the manuscript. Spelling,
        punctuation, capitalization, and abbreviations are reported as they appear in the
        manuscript. Text highlighted by Doane with an underscore is underscored in this view.
        Text canceled by Doane is suppressed. Text added by Doane between lines or in the
        margins is silently incorporated into the text. All material added by the editor is
        surrounded by square brackets: uncertain readings are enclosed in square brackets and
        followed by a question mark, and text supplied by the editor for clarity is set in
        italics and surrounded by square brackets. Gaps in the manuscript (e.g., from tears)
        are indicated by elipses enclosed by square brackets. Links to notes and external
        materials are colored and underlined.
    </xsl:variable>
    <xsl:variable name="bodyRule">
        body {
        margin: 30px;
        background-color: #FFFFFF;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        width: 50em;
        }                                     
    </xsl:variable>

    <!-- Include common style sheet for Stephens family letters. -->
    <xsl:include href="Stephens-Common.xsl"/>
    
    <!-- Define additional templates required for the reading view. -->
    
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