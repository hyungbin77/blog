---
cssclass: literature-note
aliases: {{title | replace(":","") | replace(",","") | replace(" ", "-") | title}}
authors: {{authors}} 
year: {{date | format("YYYY")}}
publisher: {{publicationTitle}}
doi: {{DOI}}
---



{{title}}

> [!info]- Info - [**Zotero**]({{desktopURI}}) | [**DOI**](https://doi.org/{{DOI}}) | {% for attachment in attachments | filterby("path", "endswith", ".pdf") %}[**PDF**](file:///{{attachment.path | replace(" ", "%20")}}){%- endfor %}
>
> {% if bibliography %}**Bibliography**: {{bibliography|replace("\n"," ")}}{% endif %}
> 
> **Authors**:: {% for a in creators %} [[{{a.firstName}} {{a.lastName}}]]{% if not loop.last %}, {% endif %}{% endfor %}
> 

> [!abstract]-
> {% if abstractNote %}
> {{abstractNote|replace("\n"," ")|striptags(true)|replace("Objectives", "**Objectives**")|replace("Background", "**Background**")|replace("Methodology", "**Methodology**")|replace("Results","**Results**")|replace("Conclusion","**Conclusion**")}}
> {% endif %}

> [!quote]- Citations
> 
> ```query
> content: "[[{{citekey}}]]" -file:[[{{citekey}}]]
> ```

# Notes
{% persist "notes" %} {% if isFirstImport %} 
Tags: [[bibliography]]
Internal Links: <% tp.file.cursor(1) %>
Paper Type (empirical, review, model): 
Main Data (survey, company, dataset):
Main Method (tools, program):
Contribution: 


{% endif %}{% endpersist %}

---
{% macro heading(color) -%}
{%- if color == "#2ea8e5" -%}
💡 Result / Key Conclusion
{%- endif -%}
{%- if color == "#ff6666" -%}
⏰ Questions / Follow Up
{%- endif -%}
{%- if color == "#ffd400" -%}
⭐ Interesting Point
{%- endif -%}
{%- if color == "#e56eee" -%}
🧩 Method
{%- endif -%}
{%- if color == "#a28ae5" -%}
🦄 Research Question / Hypothesis
{%- endif -%}
{%- if color == "#f19837" -%}
🥕 Contribution
{%- endif -%}
{%- if color == "#aaaaaa" -%}
⚙️ Data
{%- endif -%}
{%- if color == "#5fb236" -%}
📣 Literature to Read / Look Up
{%- endif -%}
{%- endmacro -%}

{% macro calloutCharacter(color) -%}
{%- if color == "#2ea8e5" -%}
$
{%- endif -%}
{%- if color == "#ff6666" -%}
@
{%- endif -%}
{%- if color == "#ffd400" -%}
&
{%- endif -%}
{%- if color == "#e56eee" -%}
~
{%- endif -%}
{%- if color == "#a28ae5" -%}
!
{%- endif -%}
{%- if color == "#f19837" -%}
€
{%- endif -%}
{%- if color == "#aaaaaa" -%}
?
{%- endif -%}
{%- if color == "#5fb236" -%}
%
{%- endif -%}
{%- endmacro -%}

{% persist "annotations" %}
{% set annotations = annotations | filterby("date", "dateafter", lastImportDate) -%}
{% if annotations.length > 0 %}
# Annotation ({{importDate | format("YYYY-MM-DD HH:mm")}})

{% for color, annotations in annotations | groupby("color") -%}
### {{heading(color)}} %% fold %%
{% for annotation in annotations -%}
{%- if annotation.imageRelativePath or annotation.inkRelativePath %}

> [!cite{% if annotation.color %}|{{annotation.color}}{% endif %}]+ Image [(p. {{annotation.pageLabel}})](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.pageLabel}}&annotation={{annotation.id}})
> {%- if annotation.imageRelativePath %}
![[{{annotation.imageRelativePath}}]]
{%- elif annotation.inkRelativePath %}
![[{{annotation.inkRelativePath}}]]
{%- endif %}
{%- if annotation.hashTags %}
> {{annotation.hashTags}}
{%- endif %}
{%- if (annotation.comment or []).indexOf("todo ") !== -1 %}
> - [ ] #followup {{annotation.comment | replace("todo ", "")}}
{%- else %}
> {{annotation.comment}}
{%- endif %}

{% elif (annotation.comment or []).indexOf("todo ") !== -1 %}
- [ ] #followup {{annotation.comment | replace("todo ", "")}}:{% if not annotation.annotatedText %} [(p. {{annotation.pageLabel}})](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.pageLabel}}&annotation={{annotation.id}}){% else %}
    - {{calloutCharacter(annotation.color)}} {{annotation.annotatedText | nl2br}} [(p. {{annotation.pageLabel}})](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.pageLabel}}&annotation={{annotation.id}}) {% if annotation.hashTags %}{{annotation.hashTags}}{% endif %}{% endif %}

{% elif annotation.comment %}
- {{annotation.comment}}{% if not annotation.annotatedText %} [(p. {{annotation.pageLabel}})](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.pageLabel}}&annotation={{annotation.id}}){% else %}
    - {{calloutCharacter(annotation.color)}} {{annotation.annotatedText | nl2br}} [(p. {{annotation.pageLabel}})](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.pageLabel}}&annotation={{annotation.id}}) {% if annotation.hashTags %}{{annotation.hashTags}}{% endif %}{% endif %}

{%- elif annotation.annotatedText %}
- {{calloutCharacter(annotation.color)}} {{annotation.annotatedText | nl2br}} [(p. {{annotation.pageLabel}})](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.pageLabel}}&annotation={{annotation.id}}) {% if annotation.hashTags %}{{annotation.hashTags}}{% endif %}

{%- endif -%}{%- endfor %}

{% endfor -%}
{% endif %}
{% endpersist %}