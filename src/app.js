export function getPipelineStatus() {
  return "Pipeline CI configurado e testado com sucesso.";
}

if (typeof document !== "undefined") {
  const statusElement = document.querySelector("#status");

  if (statusElement) {
    statusElement.textContent = getPipelineStatus();
  }
}
