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

    <xsl:variable name="View">Reading Text</xsl:variable>
    <xsl:variable name="aboutView"> This presentation of the Stephens letters derives from the
        project's main XML file, StephensCorpus.xml, transformed with Stephens-Common.xsl and
        Stephens-Reading.xsl. In this "view" of the Stephens letters, line breaks in the manuscripts
        are not reported; rather, lines wrap in the browser's window. Similarly, page breaks are not
        reported. Paragraph breaks follow those in the manuscript. Spelling, punctuation,
        capitalization, and abbreviations are reported as they appear in the manuscript. Text
        highlighted by the correspondents with an underscore is underscored in this view. Canceled
        text is suppressed. Text added between lines or in the margins is silently incorporated into
        the reading text. Uncertain readings are enclosed in square brackets and followed by a
        question mark, and text supplied by the editor for clarity is set in italics and surrounded
        by square brackets. Links to notes and external materials are superscripted and colored.
    </xsl:variable>
    <xsl:variable name="bodyRule">
        body {
        font-family: 'Fanwood Text',georgia, serif;
        font-size: 1em;
        width: 800px;
        margin-left: 50px;
        margin-right: 50px;
        margin-top: 100px;
        }
    </xsl:variable>
    <xsl:variable name="navBarRule">
        #navBar {
        position: fixed;
        top:120px;
        width:150px;
        float : left;
        text-align : left;
        <!--margin-left: 10px;-->
        margin-top:0px;
        background-color: rgba(255, 255, 255, 1);
        }
        #viewMenu {
        position: fixed;
        top:120px;
        left: 865px;
        width:150px;
        margin-top: 0px;
        }
        .close {
        position: absolute;
        top: 90px;
        right: 255px;
        color: #f1f1f1;
        font-size: 36px;
        font-weight: bold;
        transition: 0.3s;
        z-index: 2;
        }
        .description {
        position: absolute;
        top: 90px;
        right: 655px;
        color: #f1f1f1;
        font-size: 16px;
        font-weight: bold;
        transition: 0.3s;
        z-index: 2;
        }
    </xsl:variable>
    <xsl:variable name="maintextRule">
        #maintext {
        float:right;
        width:610px;
        margin-top:35px;
        margin-left:20px;
        padding:5px;
        background-color: rgba(209,209,209, 0.5);
        -webkit-border-radius: 10px;
        -moz-border-radius: 10 px;
        border-radius: 10px;	
        }
        .contents-notes {
        float:right;
        width:610px;
        margin-top:35px;
        margin-left:20px;
        padding:5px;
        background-color: rgba(209,209,209, 0.5);
        -webkit-border-radius: 10px;
        -moz-border-radius: 10 px;
        border-radius: 10px;	
        }
        
    </xsl:variable>
        
    <!-- Include common style sheet for Stephens family letters. -->
    <xsl:include href="Stephens-Common.xsl"/>
    
    <!-- Define additional templates required for the reading view. -->
    
    <xsl:template match="tei:pb"/>
    <xsl:template match="tei:lb"/>
    <xsl:template match="tei:fileDesc/tei:titleStmt/tei:title/tei:lb">
        <br/><xsl:apply-templates/>
    </xsl:template>   
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
    <xsl:template match="tei:choice/tei:sic">
        <xsl:apply-templates/> [sic] </xsl:template>
    <xsl:template match="tei:choice/tei:corr"/>
    
</xsl:stylesheet>