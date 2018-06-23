<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="no" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <!--#config timefmt="%Y-%m-%dT%X%z" -->
            <head>
                <title>
                    <xsl:apply-templates select="//titleStmt/title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="http://www.obdurodon.org/css/style.css"/>
                <link rel="stylesheet" type="text/css" href="css/vienna.css"/>
            </head>
            <body>
                <h1 style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"><a
                        class="logo" href="http://www.obdurodon.org">&lt;oo&gt;</a>→<a class="logo"
                        href="http://vienna.obdurodon.org">&lt;vie&gt;</a><xsl:text>&#xa0;</xsl:text>
                    <xsl:apply-templates select="//titleStmt/title"/></h1>
                <hr/>
                <p>
                    <a href="https://commons.wikimedia.org/wiki/File:Krems_-_Steinertor_(2).JPG"
                        style="border: none;">
                        <img class="steinertor" title="Steinertor, Krems, Austria"
                            alt="[Steinertor, Krems, Austria]" src="images/steinertor.jpg"/>
                    </a>
                </p>
                <p class="boilerplate">
                    <span><strong>Maintained by:</strong> David J. Birnbaum (<a
                            href="mailto:djbpitt@gmail.com">djbpitt@gmail.com</a>) <a
                            href="https://creativecommons.org/licenses/by-nc-sa/4.0/"
                            style="outline: none;">
                            <img src="http://www.obdurodon.org/images/cc/88x31.png"
                                alt="[Creative Commons BY-NC-SA 4.0 International License]"
                                title="Creative Commons BY-NC-SA 4.0 International License"
                                style="height: 1em; vertical-align: text-bottom;"/>
                        </a>
                    </span>
                    <span>
                        <strong>Last modified:</strong>
                        <!--#echo var="LAST_MODIFIED" -->
                    </span>
                </p>
                <hr/>
                <ol id="contents">
                    <xsl:apply-templates select="//body/div" mode="toc"/>
                </ol>
                <hr/>
                <xsl:apply-templates select="//body"/>
                <hr/>
                <p class="note">Image of Steinertor from <a
                        href="https://commons.wikimedia.org/wiki/File:Krems_-_Steinertor_(2).JPG"
                        >https://commons.wikimedia.org/wiki/File:Krems_-_Steinertor_(2).JPG</a>. <a
                        href="https://creativecommons.org/licenses/by-sa/4.0/">CC BY-SA 4.0</a>.</p>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="div">
        <section id="{generate-id()}">
            <!--            <xsl:if test="@type = 'no-enumeration'">
                <xsl:attribute name="class" select="@type"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    <xsl:template match="head">
        <xsl:element name="{'h' || count(ancestor::div) + 1}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="list">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="ref">
        <a href="{@target}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="graphic">
        <img alt="{@url}" src="{@url}"/>
    </xsl:template>
    <!-- mode "toc" -->
    <xsl:template match="div" mode="toc">
        <li>
            <!--<xsl:if test="@type eq 'no-enumeration'">
                <xsl:attribute name="class" select="@type"/>
            </xsl:if>-->
            <a href="#{generate-id()}">
                <xsl:apply-templates select="head" mode="toc"/>
            </a>
            <xsl:if test="div">
                <ol>
                    <xsl:apply-templates select="div" mode="toc"/>
                </ol>
            </xsl:if>
        </li>
    </xsl:template>
</xsl:stylesheet>
