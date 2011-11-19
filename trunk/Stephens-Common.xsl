<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
   <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Feb 19, 2010</xd:p>
         <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
         <xd:p/>
      </xd:desc>
   </xd:doc>

   <!-- This style sheet is divided into the following sections:
      
      HTML WRAPPER
      MAJOR DOCUMENT STRUCTURES
      PAGE, COLUMN, AND LINE BREAKS
      MAJOR TEXTUAL STRUCTURES
      SORTING AND FORMATTING LISTS
      ANNOTATIONS
      MANUSCRIPT FEATURES
      MISCELLANEOUS TEXTUAL FEATURES
      IMAGES      
   -->
   <xsl:template match="/">
   <!-- HTML WRAPPER: Note that this template 
      places the entire contents enclosed within the text tags of your document into 
      the HTML of the Web page. 
   -->
      <html>
         <head>
            <!-- Creat the head of the HTML document -->
            <!-- First, populate meta element with keywords -->
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
            <!-- Grab title from the fileDesc element of the TEI header. -->
            <title>
               <xsl:value-of
                  select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title"/>
            </title>
            <style type="text/css">
              <xsl:value-of select="$bodyRule"/>
               div.pagebreak {
                   margin-top : 25px;
                   margin-bottom : 0px;
                   text-align : center;
               }
               hr {
                   color : #888833;
                   clear : left;
               }
               a.annotation {
                   text-decoration:none;
               }
               a:hover {
                   font-weight:bold;
               }
               div#letter {
                   border : 3px groove #666666;
                   padding : 5px;
               }
               h1 {
                   font-family : Verdana, Arial, Helvetica, sans-serif;
                   font-size : 16pt;
                   font-style : normal;
               }
               h2 {
               }
               h3 {
               }
               sup {
               }
               img {
                   float: left;
                   padding: 5px;
                   margin-top: 5px;
                   margin-bottom: 5px;
               }

               .nocancel {
                   text-decoration : none;
                   color : #000000;
               }
               .cancel {
                   text-decoration : line-through;
                   color : #FF0000;
               }
                div.fl_img_right {
                   float : right;
                   text-align : center;
                   margin : 5px 5px 5px 5px;
               }
               .ProjectTitle {
                   font-family : Verdana, Arial, Helvetica, sans-serif;
                   font-size : 16pt;
                   font-style : normal;
                   font-weight : bolder;
                   line-height : 18pt;
               }
               .hang15 {
                   margin-left : 40px;
                   text-indent : -15px;
               }
               .hang25 {
                   margin-left : 40px;
                   text-indent : -25px;
               }
               .hang35 {
                   margin-left : 40px;
                   text-indent : -35px;
               }
               table {
                   text-align : right;
               }
            </style>
         </head>
         <!-- Build the body of the HTML document. -->
         <body>
            <!-- Create navigation links at the top of the page -->
            <p align="center">
               <span class="ProjectTitle">
                  <xsl:value-of
                     select="/tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title"/>
               </span>
            </p>
            <hr/>
            <p align="center">
               <xsl:element name="a">
                  <xsl:attribute name="href">http://people.cohums.ohio-state.edu/ulman1/StephensFamilyLetters/default.cfm</xsl:attribute>
                  <xsl:attribute name="target">self</xsl:attribute>Project Web Site</xsl:element> | 
               <xsl:element name="a">
                  <xsl:attribute name="href">http://people.cohums.ohio-state.edu/ulman1/StephensFamilyLetters/StephensLetters-EdIntro.htm</xsl:attribute>
                  <xsl:attribute name="target">self</xsl:attribute>Ed. Intro
               </xsl:element> || <strong>Views</strong>: Reading (current/<xsl:element name="a"><xsl:attribute name="href">#view</xsl:attribute><xsl:attribute name="target">self</xsl:attribute>about</xsl:element>) | 
               <xsl:element name="a">
                  <xsl:attribute name="href">http://people.cohums.ohio-state.edu/ulman1/StephensFamilyLetters/StephensLetters-Standardized.html</xsl:attribute>
                  <xsl:attribute name="target">self</xsl:attribute>
                  Reading (Standardized)
               </xsl:element>
               <xsl:element name="a">
                  <xsl:attribute name="href">http://people.cohums.ohio-state.edu/ulman1/StephensFamilyLetters/StephensLetters-Diplomatic.html</xsl:attribute>
                  <xsl:attribute name="target">self</xsl:attribute>
                  Diplomatic
               </xsl:element> | 
               <xsl:element name="a">
                  <xsl:attribute name="href">http://people.cohums.ohio-state.edu/ulman1/StephensFamilyLetters/StephensLetters-Diplomatic.html</xsl:attribute>
                  <xsl:attribute name="target">self</xsl:attribute>
                  MS Image/Text
               </xsl:element>               
               <br/><br/><strong>This edition is still being developed. Please do not cite until
                  this notice is removed.</strong>
            </p>
            
            <!-- Insert information from the <text> of each TEI element, wrapping each <text> in a div 
             of class "correspondence." -->
            <xsl:for-each select="/tei:teiCorpus/tei:TEI/tei:text">
               <div class="correspondence">
                  <xsl:apply-templates/>
               </div>
            </xsl:for-each>
            
            <!-- Insert, count, encode by cardinal position, and link the explanatory annotations. -->
            <hr/>
            <h1>Explanatory Annotations</h1>
            <xsl:for-each select="//tei:note[@xml:id]">
               <xsl:choose>
                  <xsl:when test="position()>=100">
                     <p class="hang35"><a>
                        <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:note[@xml:id]" level="any"
                        />.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:when>
                  <xsl:when test="position()>=10">
                     <p class="hang25"><a>
                        <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:note[@xml:id]" level="any"
                        />.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:when>
                  <xsl:otherwise>
                     <p class="hang15"><a>
                           <xsl:attribute name="name">n<xsl:value-of select="@xml:id"/></xsl:attribute>
                        </a>
                        <xsl:number count="//tei:note[@xml:id]" level="any"/>.&#xA0;<xsl:apply-templates/>
                        <a>
                           <xsl:attribute name="href">#p<xsl:value-of select="@xml:id"/></xsl:attribute>
                           <xsl:attribute name="class">annotation</xsl:attribute>
                           [Back]
                        </a>
                     </p>
                  </xsl:otherwise>
               </xsl:choose>

            </xsl:for-each>
            <!-- Insert the back section of the XML document's back section and invoke apply-templates. -->

            <hr/>
            <!-- Describe this view of the journal. -->
            <p>
               <strong>About this View of the Journal</strong>
            </p>
            <p><a name="view"/><xsl:value-of select="$aboutView"/></p>
            <hr/>
            <!-- Insert link to home page, creation date, and licensing statement.-->
            <p align="left">
               <a href="http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/SSCoxHome.cfm"
                  target="self">Home</a>
               <br/>
               <br/>
               <emph>Created: <xsl:apply-templates
                     select="//tei:teiCorpus/tei:teiHeader/tei:profileDesc/tei:creation/tei:date"
                  /></emph>
            </p>
            <p align="center">
               <xsl:value-of
                  select="//tei:teiCorpus/tei:teiHeader/tei:availability/tei:p[@id='CreativeCommons']"
                  disable-output-escaping="yes"/>
            </p>
         </body>
      </html>
   </xsl:template>

   <!-- MAJOR DOCUMENT STRUCTURES: These elements include the front, body, and back
      elements of you XML documents in the result tree of your output.-->

   <xsl:template match="tei:body">
      <hr/>
      <xsl:apply-templates select="tei:div[@type='letter']"/>
      <xsl:apply-templates select="tei:div[@type='enclosure']"/>
      <xsl:apply-templates select="tei:div[@type='envelope']"/>
   </xsl:template>
   <xsl:template match="tei:div[@type='envelope']">
      <div class="envelope">
      Envelope. <xsl:apply-templates
         select="ancestor::tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:accMat"></xsl:apply-templates>
      <p>Return Address:
      <xsl:apply-templates select="tei:ab[@type='returnAddress']"/></p>
      <p>Mailing Address:<xsl:apply-templates select="tei:ab[@type='postalAddress']"/></p>
      <p>Postmark: <xsl:apply-templates select="tei:ab/tei:stamp[@type='postmark']"/></p>      
      <p>Cancellation: <xsl:apply-templates select="tei:ab/tei:stamp[@type='cancellation']"/></p>      
      <p>Endorsement: <xsl:apply-templates select="tei:ab[@type='endorsement']"/></p>      
      </div>
   </xsl:template>
   <xsl:template match="tei:div[@type='enclosure']"/>
   <xsl:template match="tei:div[@type='letter']">
      <div class="letter">
      <xsl:apply-templates/>
      </div>     
      <p>
         <xsl:value-of
         select="ancestor::tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:p"/>
      </p>
    </xsl:template>

   <!-- PAGE, COLUMN, AND LINE BREAKS; Page Layout: These template rules determine how page breaks and
      line breaks will be encoded, or whether they will be included, in your Web page. -->

   <xsl:template match="tei:ab/tei:persName">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:addrLine">
      <br/><xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='letter']/tei:head">
      <p><xsl:apply-templates/></p>
   </xsl:template>
   
   <!-- Template rule for editorial divs in back matter -->

   <xsl:template match="tei:div[@type='editorial']">
      <hr/>
      <br/>
      <a>
         <xsl:attribute name="name">
            <xsl:value-of select="@xml:id"/>
         </xsl:attribute>
      </a>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:div[@type='editorial']/tei:head">
      <h1>
         <xsl:apply-templates/>
      </h1>
   </xsl:template>

   <!-- SORTING AND FORMATTING LISTS OF WORKS CITED, PLACES, ORGANIZATIONS, AND SO ON. -->

   <xsl:template match="//tei:listBibl">
      <xsl:for-each select="tei:bibl">
         <xsl:sort select="@n"/>
         <p class="hang25">
            <a>
               <xsl:attribute name="name">
                  <xsl:value-of select="@xml:id"/>
               </xsl:attribute>
            </a>
            <xsl:apply-templates/>
         </p>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="tei:bibl/tei:ref"> (<xsl:apply-templates/>) </xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   <xsl:template match="tei:title[@level='m']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   <xsl:template match="tei:title[@level='j']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   <xsl:template match="tei:listPlace">
      <xsl:for-each select="tei:place">
         <xsl:sort select="tei:geogName"/>
         <xsl:sort select="tei:placeName"/>
         <p>
            <xsl:if test="tei:geogName[1]"><strong><xsl:value-of select="tei:geogName[1]"
               /></strong></xsl:if>
            <xsl:if test="tei:geogName[2]"> (<xsl:value-of select="tei:geogName[2]"/>)</xsl:if>
            <xsl:if test="tei:placeName[1]"><strong><xsl:value-of select="tei:placeName[1]"
                  /></strong></xsl:if>
            <xsl:if test="tei:placeName[2]"> (<xsl:value-of select="tei:placeName[2]"/>)</xsl:if>.
               <xsl:value-of select="tei:country"/>
            <xsl:if test="tei:region">; <xsl:value-of select="tei:region"/></xsl:if>
            <xsl:if test="tei:location/tei:geo"> (Lat/Long: <xsl:value-of
                  select="tei:location/tei:geo"/>)</xsl:if>. <xsl:value-of select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>

   <!-- ANNOTATIONS -->

   <xsl:template match="tei:ptr[@type='noteAnchor']">
      <a>
         <xsl:attribute name="name">p<xsl:value-of select="@target"></xsl:value-of>
         </xsl:attribute>
      </a>
      <a>
         <xsl:attribute name="href">#n<xsl:value-of select="@target"/></xsl:attribute>
         <xsl:attribute name="class">annotation</xsl:attribute>
         <sup>
            <xsl:number level="any" count="tei:ptr[@type='noteAnchor']"/>
            <xsl:apply-templates/>
         </sup>
      </a>
   </xsl:template>
   <xsl:template match="tei:note[@xml:id]"/>

   <!-- MSS ITEMS: These rules process various tags particularly relevant to 
      transcriptions of primary handwritten materials. -->

   <!-- Handshifts -->
<!--   <xsl:template match="tei:handShift"> [<xsl:value-of select="@new"/>] </xsl:template>-->
   <xsl:template match="tei:handShift"/>

   <!-- Gaps in your transcript of the source text (tears in the page, and so on). -->
   <xsl:template match="tei:gap">
      <xsl:apply-templates/>[ .&#xA0;.&#xA0;. ] </xsl:template>
   <xsl:template match="tei:damage"> [<em>Damage: <xsl:value-of select="@agent"/> (<xsl:value-of
            select="@extent"/>
         <xsl:value-of select="@unit"/>)</em>] </xsl:template>

   <!-- Editorial emendations -->
   <xsl:template match="tei:supplied"> [<i>
         <xsl:apply-templates/>
      </i>] </xsl:template>

   <!-- Additions by the author or another hand. -->
   <xsl:template match="tei:add">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- Recoverable cancellations by the author or another hand -->
   <xsl:template match="tei:del"/>

   <!-- Unclear passages. -->
   <xsl:template match="tei:unclear"> [<xsl:apply-templates/>?] </xsl:template>

   <!-- Nonstandard or erroneous text for which you have encoded a correct or regularized alternative. -->
   <xsl:template match="tei:choice/tei:orig">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:choice/tei:reg"/>
   <xsl:template match="tei:distinct[@type='babyTalk']">
      <xsl:apply-templates/> [sic] 
   </xsl:template>

   <!--MISCELLANEOUS TEXTUAL FEATURES. -->

   <!-- Quotes -->
   <xsl:template match="tei:q">
      <q>
      <xsl:apply-templates/>
      </q>
   </xsl:template>

   <!-- Abbreviations -->
   <xsl:template match="tei:choice/tei:abbr">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:choice/tei:expan"/>

   <!-- Passages in languages other than your document's base language. -->
   <xsl:template match="tei:foreign">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>

   <!-- Names -->
   <xsl:template match="tei:rs">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:name[@type='ship']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>

   <!-- Text highlighted in the source document -->

   <xsl:template match="tei:hi[@rend='underlined']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='superscript']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>

   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->

   <xsl:template match="tei:figure[@rend='link']"> [<a>
         <xsl:attribute name="HREF">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
         </xsl:attribute>
         <xsl:attribute name="target">blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </a>]. </xsl:template>

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
</xsl:stylesheet>
