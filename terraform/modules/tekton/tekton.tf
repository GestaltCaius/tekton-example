data "http" "tekton_operator_release" {
  url = "https://storage.googleapis.com/tekton-releases/operator/previous/${var.tekton_version}/release.yaml"
}

data "http" "tekton_operator_profile" {
  url = "https://raw.githubusercontent.com/tektoncd/operator/${var.tekton_version}/config/crs/kubernetes/config/all/operator_v1alpha1_config_cr.yaml"
}

data "kubectl_file_documents" "tekton_operator_release" {
  content = data.http.tekton_operator_release.response_body
}

resource "kubectl_manifest" "tekton_operator" {
  for_each  = data.kubectl_file_documents.tekton_operator_release.manifests
  yaml_body = each.value
  force_new = true
}

resource "kubectl_manifest" "tekton_profile" {
  depends_on = [kubectl_manifest.tekton_operator]
  yaml_body  = data.http.tekton_operator_profile.response_body
  force_new  = true
}
