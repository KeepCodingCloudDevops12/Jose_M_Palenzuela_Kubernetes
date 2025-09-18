{{- define "radarr-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 93 | trimSuffix "-" -}}
{{- end -}}

{{- define "radarr-chart.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 93 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 93 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 93 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "radarr-chart.labels" -}}
helm.sh/chart: {{ include "radarr-chart.chart" . }}
{{ include "radarr-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "radarr-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "radarr-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "radarr-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 93 | trimSuffix "-" -}}
{{- end -}}
