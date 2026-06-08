import test from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { getPipelineStatus } from "../src/app.js";

test("deve retornar mensagem de status do pipeline", () => {
  assert.equal(
    getPipelineStatus(),
    "Pipeline CI configurado e testado com sucesso."
  );
});

test("o arquivo index.html deve conter o elemento de status", () => {
  const html = readFileSync("src/index.html", "utf8");

  assert.match(html, /id="status"/);
  assert.match(html, /DevOps na Prática/);
});
