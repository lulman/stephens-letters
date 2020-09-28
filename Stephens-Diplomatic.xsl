<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xd tei"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 29, 2011</xd:p>
            <xd:p><xd:b>Author:</xd:b> lulman</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- Declare variables that will "localize" references to them in Stephens-Common.xsl -->
    
    <xsl:variable name="View">Diplomatic Transcription</xsl:variable>
    <xsl:variable name="aboutView">This presentation of the Stephens letters derives from the
        project's main XML file, StephensCorpus.xml, transformed with Stephens-Common.xsl and
        Stephens-Diplomatic.xsl. In the text of the letter, line and page breaks follow those in
        the manuscript; paragraph breaks are not reported. Spelling, punctuation, capitalization, and
        abbreviations are reported as they appear in the manuscript. Text highlighted by Hawthorne
        with an underscore is underscored. Text canceled by Hawthorne is presented in a red,
        strikethrough font. Uncertain readings are enclosed in square brackets and followed by a
        question mark. Text added by Hawthorne between lines is preceded by an arrow indicating
        whether the addition is above or below the line and followed by an arrow indicating the return
        to the line (&#x2191; &#x2193;); text added in the margins is preceded and followed by a
        vertical bar (&#x007C;). Text added by Hawthorne in the margins is surrounded by "pipe"
        characters (|) at the point in the main text that it appears to follow. Links to external
        materials are colored and underlined.</xsl:variable>
    <xsl:variable name="bodyRule">
        body {
        font-family: Times, 'Times New Roman', serif;
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
       
    <!-- Define templates required for the diplomatic view. -->
    
    <xsl:template match="tei:pb">
       <!-- <hr/>-->
        <br/><br/>
        <span class="pagebreak">[Page&#xA0;-&#xA0;<xsl:number count="tei:pb" format="1" level="any" from="tei:div[@type='letter']"/>
            &#xA0;(<a><xsl:attribute name="HREF"><xsl:value-of
                select="@facs"/>.jpg</xsl:attribute>
            <xsl:attribute name="target">top</xsl:attribute>click to open page image in a new window</a>)]</span>
      <!--  <br/>-->
    </xsl:template> 
    
    <xsl:template match="tei:lb">
        <br/>
<!--WE ARE NOT PLACING ID TAGS ON INDIVIDUAL LINES IN THIS EDITION
            <a>
            <xsl:attribute name="id">
                <xsl:number count="tei:lb" format="0001" level="any" from="tei:div[@type='letter']"/>
            </xsl:attribute>
        </a>
-->        <xsl:number count="tei:lb" format="0001" level="any" from="tei:div[@type='letter']"/>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;
    </xsl:template>
    <xsl:template match="tei:fileDesc/tei:titleStmt/tei:title/tei:lb">
        <br/><xsl:apply-templates/>
    </xsl:template>   
    <xsl:template match="tei:seg[@type='softhyphen']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Additions by the author or another hand -->
    
    <xsl:template match="tei:add[@place='supralinear']"> &#x2191; <xsl:apply-templates/> &#x2193; </xsl:template>
    <xsl:template match="tei:add[@place='infralinear']"> &#x2193; <xsl:apply-templates/> &#x2191; </xsl:template>
    <xsl:template match="tei:add[@place='inline']">&#x7c;<xsl:apply-templates/>&#x7c;</xsl:template>
    <xsl:template match="tei:add[@place='margin']">|<xsl:apply-templates/>|</xsl:template>
    
    
    <!-- Highlight recoverable cancelations -->
    <xsl:template match="tei:del"><span class="cancel"><xsl:apply-templates/></span></xsl:template>
    
    <xsl:template match="tei:p"><xsl:apply-templates/></xsl:template>

    <!-- Deal with sic/corr tags -->
    <xsl:template match="tei:choice/tei:sic">
        <xsl:apply-templates/> [<xsl:element name="span"><xsl:attribute name="style">font-style: italic;</xsl:attribute>sic</xsl:element>]
    </xsl:template>
    <xsl:template match="tei:choice/tei:corr"/>
    
    <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->
<!--    <xsl:template match="tei:figure[@rend='embed']"/>
-->    
    <xsl:template match="tei:figure[@rend='embed']">
        <div class="fl_img_right">
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:graphic/@url"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="tei:figDesc"/>
                </xsl:attribute>
            </img>
            <br/>
            <xsl:value-of select="tei:head"/>
        </div>
    </xsl:template>
    
    
    <xsl:template match="tei:figure[@rend='link']"> [<a>
        <xsl:attribute name="HREF">
            <xsl:value-of select="tei:graphic/@url"/>
        </xsl:attribute>
<!--        <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
        </xsl:attribute>
-->        <xsl:attribute name="target">blank</xsl:attribute>
        <xsl:value-of select="tei:head"/>
    </a>]. </xsl:template>
    
    
    
</xsl:stylesheet>