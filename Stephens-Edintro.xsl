<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
   <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Feb 19, 2010</xd:p>
         <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
         <xd:p></xd:p>
      </xd:desc>
   </xd:doc>
   <!-- 
   
   HTML WRAPPER: Note that this section (between the xsl:template tags) 
   places the entire contents enclosed within the TEI Header of your document into 
   the body element of the Web page. 
   
   -->
   <xsl:template match="/">
      <html>
         <head>
            <!-- Populate meta element with keywords -->
            <xsl:element name="meta">
               <xsl:attribute name="name">keywords</xsl:attribute>
               <xsl:attribute name="content">
                  <xsl:for-each select="//tei:keywords[@scheme='#LCSH']/tei:term">
                     <xsl:choose>
                        <xsl:when test="current()=//tei:keywords[@scheme='#LCSH']/tei:term[1]">
                           <xsl:apply-templates/>
                        </xsl:when>
                        <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
                     </xsl:choose>
                  </xsl:for-each>
               </xsl:attribute>
            </xsl:element>
            <title>
               <xsl:value-of
                  select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
            </title>
            <style>
               body {
                   font-family: Verdana, Arial, Helvetica, sans-serif;
                   font-size: 1em;
                   margin: 25px;
                   width: 800px;
                    
               }
               .masthead {
                   vertical-align : top;
               }
               .mastheadl {
                   float : left;
                   width : 175px;
                   text-align : left;
                   left : 50px;
               }
               .mastheadc {
                   display : inline;
               }
               .mastheadr {
                   float : right;
                   text-align : right;
                   width : 225px;
                   position : absolute;
                   top : 15px;
                   left : 700px;
                   }
               a:link {
               text-decoration: none;
               }
               a:hover {
               font-weight: bold;
                   }
               a.annotation {
               text-decoration: none;
                   }
               h1 {
                   font-size: 1.5em;
                   font-weight: bold;
                    
               }
               h2 {
                   font-size: 1.5em;
                   font-weight: bold;
                    
               }
               h3 {
                   margin-top: 2em;
                   font-size: 1.25em;
                   font-style: italic;                    
               }
               p {
                   font-family:
                   Verdana, Arial, Helvetica, sans-serif;                    
               }
               hr {
                   clear: right;
               }
               div.fl_img_right {
                   float: right;
                   text-align: center;
                   margin: 5px 5px 5px 5px;
               }
               .projectTitle {
                   text-align: center;
                    
               }
               .revTable {
                   font-size: 1em;
                   font-family: Verdana, Arial, Helvetica, sans-serif;
                    
               }
               .links {
                   font-size: .85em;
                   text-align: center;
                    
               }
               .bibl {
                   text-indent: -1em;
                   margin-left: 1em;
                    
               }
               .blockquote {
                   margin-left: 2em;
               }
               .float_right {
                   float: right;
                   margin: 10px 10px 10px 10px;
                    
               }
            </style>
         </head>
         <body>
            <div class="masthead">
               <div class="mastheadl">
                  <p>
                     <a href="StephensReading.html"
                        title="Link to the reading text of the letters.">Reading Text</a> &#xa4;<br/>
                     <a href="#source">The Source Document</a><br/>
                     <a href="#edition">The Electronic Edition</a><br/>
                     <a href="#revision">Revision History</a><br/>
                  </p>
               </div>
               <div class="mastheadc"><img src="https://images.asc.ohio-state.edu/is/image/englishdocs/1/1d1e448a-6a1f-4096-9acb-bf07c5b6cc50.jpg?scale=0.2&amp;rgn=60,60,100,100&amp;fmt=png" alt="Stationery Logo for Alaska Steamship Company" name="Logo" height="90" id="Logo" />&#xA0;&#xA0;<img src="https://images.asc.ohio-state.edu/is/image/englishdocs/5/55a80091-d3ab-4cd6-a24b-75684d1f6a71.jpg?scale=0.2&amp;rgn=340,40,220,90&amp;fmt=png" alt="Postage cancel from Seattle World's Fair" name="Cancel" id="Cancel" /><img src="https://images.asc.ohio-state.edu/is/image/englishdocs/9/93100908-de33-4b45-b71f-5899daaae7cc.jpg?scale=0.2&amp;rgn=220,44,190,100&amp;fmt=png" alt="Image of cancellation on envelope" name="Cancel2" height="90" id="Cancel2" /> </div>
               <div class="mastheadr"> 
                  <p>
                     <a href="#PeopleMentioned" 
                        title="List of people mentioned in the letters.">People Mentioned</a><br/>
                     <a href="#PlacesMentioned"
                        title="List of places mentioned in the letters.">Places Mentioned</a><br/>
                     <a href="#WorksCited" 
                        title="List of works cited in explanatory annotations and editorial introduction.">Works Cited
                     </a><br/>
                     <a href="#view">About this page</a>
                  </p>
               </div>
            </div>
            <div style="clear:both;"/><br/>
            <hr/>
            <p align="center">
               <span class="ProjectTitle">
                  <xsl:value-of
                     select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title"/>
               </span>
            </p>
            <p align="center"><cite><strong>This edition is currently in progress. Please do
               not cite this preview until this notice is removed.</strong></cite> </p>
            <hr/>
            <hr/>
     <!-- Order and apply templates for the sections of the header you wish to include. -->
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='introductory']"/>
            <xsl:apply-templates
               select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='descriptive']"/>
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt"/>
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:projectDesc"/>
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:editorialDecl"/>
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:refsDecl"/>
            <hr/>
            <a name="WorksCited"/>
            <h2>List of Works Cited</h2>
            <xsl:apply-templates
               select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl"/>
            <hr/>
            <h2>Appendices</h2>            
            <xsl:apply-templates
               select="/tei:teiCorpus/tei:teiHeader/tei:profileDesc/tei:particDesc/tei:listPerson"/>
            <xsl:apply-templates
               select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace"/>
            <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:revisionDesc"/>
            <hr/>
            <p>
               <strong>About this Editorial Introduction</strong>
            </p>
            <p><a name="view"/>Text on this page is derived from the
               edition's XML source document, StephensCorpus.xml.</p>
            <hr/>
            <p>&#x2192; <a href="StephensLetters.html">Link to the text of the journal</a>.
            </p>
         </body>
      </html>
   </xsl:template>
   
   <!-- Format the introductory notes. -->
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='introductory']">
         <h2>Introduction</h2>
      <xsl:apply-templates/>
   </xsl:template>
   
   <!-- Format information about your source document. -->
   <xsl:template
      match="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='descriptive']">
      <hr/>
      <a name="source"/>
      <h2>About the Source Documents</h2>
      <p>Title: "<xsl:value-of select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title"/>" 
         <br/>Extent: <xsl:value-of select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:extent"/>
      </p>
         <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/refsDecl">
      <h3>Encoding Conventions</h3>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability">
      <p>
         <em>
            <xsl:apply-templates/>
         </em>
      </p>
      <p>
         <em>
            <xsl:value-of select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:pubPlace"/>, <xsl:value-of
               select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>
         </em>
      </p>
   </xsl:template>

   <!-- Format information about your electronic document. -->
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:projectDesc">
      <h3>Project Description</h3>
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt">
      <hr/>
      <a name="edition"/>
      <h2>About the Electronic Edition</h2>
      <p>Title: <xsl:value-of select="tei:title"/></p>
         <p>Editors: <xsl:for-each select="tei:editor/tei:persName">
            <xsl:choose>
               <xsl:when test="current()=//tei:titleStmt/tei:editor[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.</p>
      <xsl:for-each select="tei:respStmt">
         <p>
      <xsl:value-of select="tei:resp"/>
      <xsl:for-each select="tei:persName">
            <xsl:choose>
               <xsl:when test="current()=//tei:respStmt/tei:persName[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.
         </p>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:editorialDecl">
      <h3>Editorial Method</h3>
      <xsl:apply-templates/>
   </xsl:template>
   
   <!-- SORTING AND FORMATTING LISTS OF WORKS CITED, PLACES, ORGANIZATIONS, AND SO ON. -->
   
   <xsl:template match="tei:listBibl">
      <xsl:for-each select="tei:bibl">
         <xsl:sort select="@n"/>
         <p class="hang25"><a>
            <xsl:attribute name="name"><xsl:value-of select="@xml:id"/></xsl:attribute></a>
            <xsl:apply-templates/></p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:listPerson[@type='mentioned']">
      <a name="PeopleMentioned"/>
      <h3>List of People Mentioned in the Letters</h3>
      <xsl:for-each select="tei:person">
         <xsl:sort select="tei:persName"/>
         <p>
            <strong><xsl:value-of select="tei:persName"/></strong>
         <xsl:if test="tei:birth">
            <xsl:text> (b. </xsl:text><xsl:value-of
            select="tei:birth/tei:date[@when]"/><xsl:if test="tei:death"> - d. <xsl:value-of
               select="tei:death/tei:date[@when]"></xsl:value-of></xsl:if>)</xsl:if>.
          <xsl:apply-templates select="tei:note[@type='biographical']"/>
         </p>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="tei:listPerson[@type='editors']"/>
         
   
   
   <xsl:template match="tei:listPlace">
      <a name="PlacesMentioned"/>
      <h3>List of Places Mentioned in the Letters</h3>
      <xsl:for-each select="tei:place">
         <xsl:sort select="tei:geogName"/>
         <xsl:sort select="tei:placeName"/>
         <p>
            <xsl:if test="tei:geogName[1]"><strong><xsl:value-of select="tei:geogName[1]"/></strong></xsl:if>
            <xsl:if test="tei:geogName[2]"> (<xsl:value-of select="tei:geogName[2]"/>)</xsl:if>
            <xsl:if test="tei:placeName[1]"><strong><xsl:value-of select="tei:placeName[1]"/></strong></xsl:if>
            <xsl:if test="tei:placeName[2]"> (<xsl:value-of select="tei:placeName[2]"/>)</xsl:if>.
            <xsl:value-of select="tei:country"/> 
            <xsl:if test="tei:region">; <xsl:value-of select="tei:region"/></xsl:if>
            <xsl:if test="tei:location/tei:geo"> (Lat/Long: 
               <xsl:value-of select="tei:location/tei:geo"/>)</xsl:if>. 
            <xsl:value-of select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>

   <!-- Format information about the revision history of your document. -->
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:revisionDesc">
         <p align="center">
            <xsl:value-of
               select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p[@xml:id='CreativeCommons']"
               disable-output-escaping="yes"/>
         </p>
         <hr/>
         <a name="revision"/>
         <h2>Revision History</h2>
      <table width="90%">
         <tr>
            <td>
               <h3>Date</h3>
            </td>
            <td>
               <h3>Role</h3>
            </td>
            <td>
               <h3>Name</h3>
            </td>
            <td>
               <h3>Change</h3>
            </td>
         </tr>
         <xsl:for-each select="tei:change">
            <tr class="revTable" valign="top">
               <td nowrap="nowrap">
                  <xsl:value-of select="@when"/>
               </td>
               <td nowrap="nowrap">
                  <xsl:value-of select="tei:roleName"/>
               </td>
               <td nowrap="nowrap">
                  <a><xsl:attribute name="HREF"><xsl:value-of select="@who"/></xsl:attribute>HLU</a>
               </td>
               <td>
                  <xsl:value-of select="text()"/>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>

   <!-- Format miscellaneous elements -->
   <xsl:template match="//tei:p[not(@xml:id='CreativeCommons')]">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="tei:q[@rend='block']">
      <br/>
      <br/>
      <div class="blockquote">
         <xsl:apply-templates/>
         <br/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="tei:name">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:name[@type='ship']">
      <i><xsl:apply-templates/></i>
   </xsl:template>
   <xsl:template match="tei:foreign">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='italics']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   <xsl:template match="tei:emph[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="emph[@rend='italics']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='italic']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='underline']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="emph[@rend='sup']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>
   <xsl:template match="tei:q">
      "<xsl:apply-templates/>"
   </xsl:template>
   <xsl:template match="tei:note[@type='introductory']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   <xsl:template match="tei:title[@level='m']"><cite><xsl:apply-templates/></cite></xsl:template>
   <xsl:template match="tei:title[@level='j']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>   
   <xsl:template match="tei:date">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->
   <xsl:template match="tei:figure[@rend='link']"> 
      <a>
         <xsl:attribute name="HREF">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
         </xsl:attribute>
         <xsl:attribute name="target">blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </a></xsl:template>
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
  
   <!-- Suppress some unused elements in the XML file. -->
   <xsl:template match="tei:text"/>
   <xsl:template match="tei:editor"/>
   <xsl:template match="tei:principal"/>
   <xsl:template match="tei:editionStmt"/>
   <xsl:template match="tei:extent"/>
   <xsl:template match="tei:encodingDesc"/>
   <xsl:template match="tei:profileDesc"/>
   <xsl:template match="tei:idno"/>
   <xsl:template match="tei:publisher"/>
   <xsl:template match="tei:pubPlace"/>
   <xsl:template match="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p[@xml:id='CreativeCommons']"/>
</xsl:stylesheet>
