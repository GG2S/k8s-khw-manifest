{{/*
Expand the name of the chart.
*/}}
{{- define "hello-kube.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hello-kube.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{/*
DIY chart
*/}}

{{- define "hello-kube.image" -}}
{{ .Values.image.user }}/{{ .Values.image.repository }}:{{ .Values.image.tag }}
{{- end}}

{{- define "hello-kube.labels" -}}
app.kubernetes.io/name: {{ index .Values.commonLabels "app.kubernetes.io/name" }}
app.kubernetes.io/instance: {{ index .Values.commonLabels "app.kubernetes.io/instance" }}
app.kubernetes.io/component: {{ index .Values.commonLabels "app.kubernetes.io/component" }}
app.kubernetes.io/part-of: {{ index .Values.commonLabels "app.kubernetes.io/part-of" }}
app.kubernetes.io/version: {{ .Values.image.tag }}
{{- end }}

{{- define "hello-kube.selectorLabels" -}}
app.kubernetes.io/name: {{ index .Values.commonLabels "app.kubernetes.io/name" }}
app.kubernetes.io/instance: {{ index .Values.commonLabels "app.kubernetes.io/instance" }}
{{- end }}













