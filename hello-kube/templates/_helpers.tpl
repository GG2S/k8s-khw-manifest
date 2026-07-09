{{/*
Expand the name of the chart.
*/}}
{{- define "hello-kube.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- define "hello-kube.image" -}}
{{ .Values.image.user }}/{{ .Values.image.repository }}:{{ .Values.image.tag }}
{{- end}}



{{/*
DIY chart
*/}}

{{- define "hello-kube.labels" -}}
app.kubernetes.io/name: {{ index .Values.commonLabels "app.kubernetes.io/name" }}
app.kubernetes.io/instance: {{ index .Values.commonLabels "app.kubernetes.io/instance" }}
app.kubernetes.io/component: {{ index .Values.commonLabels "app.kubernetes.io/component" }}
app.kubernetes.io/part-of: {{ index .Values.commonLabels "app.kubernetes.io/part-of" }}
app.kubernetes.io/version: {{ index .Values.commonLabels "app.kubernetes.io/version" | quote }}
{{- end }}

{{- define "hello-kube.selectorLabels" -}}
app.kubernetes.io/name: {{ index .Values.commonLabels "app.kubernetes.io/name" }}
app.kubernetes.io/instance: {{ index .Values.commonLabels "app.kubernetes.io/instance" }}
{{- end }}













