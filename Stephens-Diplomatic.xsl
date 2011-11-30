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
        The text of the journal is organized by manuscript pages. Line breaks
        and page breaks reflect those in the manuscript; paragraph breaks are not reported.
        Spelling, punctuation, capitalization, and abbreviations are reported as they appear
        in the manuscript. Text highlighted by Doane with an underscore is underscored in
        this view. Recoverable text canceled by Doane is reported in red, strikethrough text;
        unrecoverable text canceled by Cox is reported with an ellipsis in red, strikethrough
        text. Text added by Cox between lines is reported between arrows (↑ ↓) indicating the
        position of the addition; text added in the margin is reported between pipes (|). All
        material added by the editor is surrounded by square brackets: uncertain readings are
        enclosed in square brackets and followed by a question mark, errors in the manuscript
        are indicated by sic, and text supplied by the editors for clarity is set in italics.
        Gaps in the manuscript (e.g., tears) are noted by ellipses within square brackets.
        Links to explanatory notes are numbered, colored, and underlined; links to textual
        annotations are lettered, colored, and underlined.
    </xsl:variable>
    <xsl:variable name="bodyRule">
        body {
        background-position: top;
        margin-left: 50px;
        width: 850px;
        margin-right: 50px;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        }                                     
    </xsl:variable>    
    
    <!-- Include common style sheet for Stephens family letters. -->
    
    <xsl:include href="Stephens-Common.xsl"/>
    
    <!-- Define templates required for the diplomatic view. -->
    
    <xsl:template match="tei:pb">
        <hr/>
        <br/>
        <span class="pagebreak">[Page&#xA0;-&#xA0;<xsl:number count="tei:pb" format="1" level="any"/>
            &#xA0;(<a><xsl:attribute name="HREF">http://people.cohums.ohio-state.edu/ulman1/StephensFamilyLetters/StephensZoom.cfm?file=<xsl:value-of
                select="@facs"/>.jpg</xsl:attribute>
            <xsl:attribute name="target">top</xsl:attribute>click to open page image in a new window</a>)]</span>
        <br/>
    </xsl:template>    
    <xsl:template match="tei:lb">
        <br/>
        <a>
            <xsl:attribute name="name">
                <xsl:number count="tei:lb" format="0001" level="any" from="tei:div[@type='letter']"/>
            </xsl:attribute>
        </a>
        <xsl:number count="tei:lb" format="0001" level="any" from="tei:div[@type='letter']"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
    </xsl:template>
    <xsl:template match="tei:seg[@type='softhyphen']">
        <xsl:apply-templates/>
    </xsl:template>    
    <xsl:template match="tei:p"><xsl:apply-templates/></xsl:template>
    <xsl:template match="tei:choice/tei:sic">
        <xsl:apply-templates/> [sic] </xsl:template>
    <xsl:template match="tei:choice/tei:corr"/>
    
    
</xsl:stylesheet>