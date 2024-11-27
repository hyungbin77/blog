---
cssclasses: research-note
tags: {% if allTags %}{{allTags}}{% endif %}
citekey: {{citekey}}
---

## Summary

{% persist "notes" -%}
{%- if isFirstImport %}
### Summary of Key Ideas
- Add your summary here
{%- endif %}
{% endpersist %}

## Annotation

{% persist "annotations" %}
{% if annotations.length > 0 %}
### Imported on {{importDate | format("YYYY-MM-DD h:mm a")}}
{%- for annotation in annotations %}
{% if annotation.color !== "#ffd400" %}
>[!quote{% if annotation.color %}|{{annotation.color}}{% endif %}] {{calloutHeader(annotation.color)}}
>{%- endif -%}{% if annotation.imageRelativePath %}
![[{{annotation.imageRelativePath}}]] {% endif %}{% if annotation.annotatedText %}
{{annotation.annotatedText}} [(p. {{annotation.pageLabel}})](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.pageLabel}}&annotation={{annotation.id}}){%- endif %}{%- if annotation.comment %}
%%{{annotation.comment}}%%{%- endif %}{%- endfor %}{% endif %} 
{% endpersist %}