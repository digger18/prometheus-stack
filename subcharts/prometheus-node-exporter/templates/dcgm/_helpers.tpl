{{- define "nvidia-dcgm-exporter.name" -}}
nvidia-dcgm-exporter
{{- end -}}

{{- define "nvidia-dcgm-exporter.fullname" -}}
{{ $name := "nvidia-dcgm-exporter" }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return the proper Dcgm Exporter image name
*/}}
{{- define "nvidia-dcgm-exporter.image" }}
{{- $registryName := default .Values.dcgmExporter.image.registry .Values.global.localRegistry -}}
{{- $repositoryName := .Values.dcgmExporter.image.repository -}}
{{- $name := .Values.dcgmExporter.image.name -}}
{{- $tag := .Values.dcgmExporter.image.tag | toString -}}
{{- printf "%s%s%s:%s" $registryName $repositoryName $name $tag -}}
{{- end }}

{{/* Generate basic labels for Dcgm */}}
{{- define "nvidia-dcgm-exporter.labels" }}
app: {{ template "nvidia-dcgm-exporter.name" . }}
heritage: {{.Release.Service }}
release: {{.Release.Name }}
chart: {{ template "prometheus-node-exporter.chart" . }}
{{- end }}