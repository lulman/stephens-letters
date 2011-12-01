<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:kml="http://www.opengis.net/kml/2.2">
  <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Mar 6, 2010</xd:p>
      <xd:p><xd:b>Author:</xd:b> syd</xd:p>
      <xd:p/>
    </xd:desc>
  </xd:doc>
  
  <!-- This XSL file transforms the <place> children of a <listPlace> in a TEI P5 file into KML.    -->
  <!-- Revised 10 April 2010 by H. Lewis Ulman, with guidance from Syd Bauman and Patrick Rashleigh.-->
  <!-- TODO: Add folders for each voyage (may require change to XML source).                        -->
  
  <xsl:output method="xml"/>
  <xsl:template match="/">
    <kml xmlns="http://www.opengis.net/kml/2.2">
      <Document>
        
        <!-- NOTE: Revise the next line to pull value from markup. -->
        
          <name>Places Mentioned in the Stephens Family Travel Letters</name>
        <open>1</open>
        <Style id="Stephens">
          <BalloonStyle>
            <text>$[description]</text>
          </BalloonStyle>
          <IconStyle>
            <Icon>
              <href>http://people.cohums.ohio-state.edu/ulman1/StephensFamilyLetters/images/world.png</href>
            </Icon>
          </IconStyle>
        </Style>
        
        <!-- Build a KML placemark for each <place> element in <listPlace>. -->
        
          <xsl:for-each
            select="/tei:teiCorpus/tei:teiHeader[1]/tei:fileDesc/tei:sourceDesc/tei:listPlace/tei:place">
                <Placemark>
                  
                  <!-- Populate KML name element from <placeName> or <geogName> in each <place>. -->
                  
                  <name><xsl:value-of select="tei:placeName | tei:geogName"/></name>
                  <styleUrl>#Stephens</styleUrl>
                  <description>

                     <!-- The KML description field is simple text. To deploy HTML in browser, it must be
                     it must be escaped here or in CDATA format. -->
                     
                     <!-- Populate the feature listing with the value of the @type of <place>. -->
                     
                    <xsl:text>Feature: </xsl:text>
                    <xsl:value-of select="@type"/>
                     
                     <!-- Populate the Region/Country listing with the value of the <region> and 
                     <country> children of <place>. -->
                     
                    <xsl:text>.<![CDATA[<br/><br/>]]>Region/Country: </xsl:text>
                    <xsl:if test="tei:region">
                      <xsl:apply-templates select="tei:region" mode="text-only"/><xsl:text>, </xsl:text>
                    </xsl:if>
                    <xsl:apply-templates select="tei:country" mode="text-only"/>
                    <xsl:text>.<![CDATA[<br/><br/>]]></xsl:text>
                    
                    <!-- Populate the description with the <desc> child of <place>. --> 
                     
                    <xsl:apply-templates select="tei:desc" mode="text-only"/>
                     
                    <!-- Populate the link to the first mention of this <place> in the journal
                         with the value of the @xml:id of the ancestor <div> of type "Entry"
                         containing a <placeName>, <geogName>, or <rs> associated with this
                         <place> via a @ref attribute. -->
                     
                    <xsl:text><![CDATA[<br/><br/>]]>Click to view the: </xsl:text>
                    <xsl:variable name="reftag" select="concat('#',@xml:id)"></xsl:variable>
                     <xsl:element name="a"><xsl:attribute
                       name="href">http://people.cohums.ohio-state.edu/ulman1/StephensFamilyLetters/StephensHTMLViews/StephensReading.html<xsl:text>#</xsl:text><xsl:value-of
                       select="//tei:TEI/tei:text/tei:body//tei:*[(name()='geogName' or
                       name()='placeName' or name()='rs') and
                       @ref=$reftag][1]/ancestor-or-self::tei:div[1][@type='letter']/@xml:id"/></xsl:attribute>First
                       mention of this place the in Stephens letters</xsl:element>
                    <![CDATA[<br/>]]> 
                   </description>                                  
                  <Point>
                    <coordinates>
                      
                      <!-- Populate the coordinates element with the value of the <geo> element.
                      NOTE: The TEI <geo> tag uses lat/long format by default, which must be
                      converted to long/lat for KML, accomplished here with the substring-after and
                      substring-before functions. -->
                      
                      <xsl:value-of select="substring-after(tei:location/tei:geo,' ')"/>
                      <xsl:text>,</xsl:text>
                      <xsl:value-of select="substring-before(tei:location/tei:geo,' ')"/>                      
                    </coordinates>
                  </Point>
                </Placemark>
          </xsl:for-each>
        </Document>
    </kml>
  </xsl:template>  
</xsl:stylesheet>
