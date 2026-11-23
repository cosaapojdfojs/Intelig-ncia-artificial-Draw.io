<mxfile host="app.diagrams.net">
  <diagram name="Página-1" id="UVKX1rqoISY0DxAhbJB6">
    <mxGraphModel dx="1241" dy="677" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="827" pageHeight="1169" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <UserObject label="" mermaidData="{&#xa;  &quot;data&quot;: &quot;erDiagram\n  USUARIO {\n    UUID usuario_id PK\n    VARCHAR email UK\n    VARCHAR nome\n    VARCHAR status\n    TIMESTAMP criado_em\n  }\n  PAPEL {\n    UUID papel_id PK\n    VARCHAR nome\n    VARCHAR descricao\n  }\n  PERMISSAO {\n    UUID permissao_id PK\n    VARCHAR codigo UK\n    VARCHAR descricao\n  }\n  USUARIO_PAPEL {\n    UUID usuario_papel_id PK\n    UUID usuario_id FK\n    UUID papel_id FK\n    TIMESTAMP atribuido_em\n  }\n  PAPEL_PERMISSAO {\n    UUID papel_permissao_id PK\n    UUID papel_id FK\n    UUID permissao_id FK\n  }\n  PROJETO {\n    UUID projeto_id PK\n    VARCHAR nome\n    VARCHAR descricao\n    UUID criado_por FK\n    TIMESTAMP criado_em\n  }\n  MEMBRO_PROJETO {\n    UUID membro_projeto_id PK\n    UUID projeto_id FK\n    UUID usuario_id FK\n    VARCHAR nivel_acesso\n    TIMESTAMP adicionado_em\n  }\n  SEGREDO_CREDENCIAL {\n    UUID segredo_id PK\n    UUID projeto_id FK\n    VARCHAR provedor\n    VARCHAR referencia_secreta\n    TIMESTAMP atualizado_em\n  }\n\n  DATASET {\n    UUID dataset_id PK\n    UUID projeto_id FK\n    UUID criado_por FK\n    VARCHAR nome\n    VARCHAR descricao\n    VARCHAR uri_armazenamento\n    TIMESTAMP criado_em\n  }\n  VERSAO_DATASET {\n    UUID versao_dataset_id PK\n    UUID dataset_id FK\n    VARCHAR rotulo_versao\n    JSONB esquema\n    INT numero_registros\n    TIMESTAMP criado_em\n  }\n  FONTE_DADOS {\n    UUID fonte_dados_id PK\n    UUID projeto_id FK\n    VARCHAR tipo_fonte\n    VARCHAR uri\n    JSONB configuracao\n    TIMESTAMP criada_em\n  }\n  CONECTOR_DADOS {\n    UUID conector_id PK\n    UUID fonte_dados_id FK\n    VARCHAR tipo_conector\n    JSONB configuracao\n    BOOLEAN ativo\n  }\n  EXECUCAO_INGESTAO {\n    UUID ingestao_id PK\n    UUID fonte_dados_id FK\n    UUID versao_dataset_id FK\n    VARCHAR status\n    TIMESTAMP iniciada_em\n    TIMESTAMP concluida_em\n  }\n  TRANSFORMACAO_DADOS {\n    UUID transformacao_id PK\n    UUID projeto_id FK\n    VARCHAR nome\n    TEXT codigo\n    JSONB parametros\n    TIMESTAMP criada_em\n  }\n  EXECUCAO_TRANSFORMACAO {\n    UUID execucao_transformacao_id PK\n    UUID transformacao_id FK\n    UUID versao_dataset_entrada_id FK\n    UUID versao_dataset_saida_id FK\n    VARCHAR status\n    TIMESTAMP iniciada_em\n  }\n  FEATURE_SET {\n    UUID feature_set_id PK\n    UUID projeto_id FK\n    VARCHAR nome\n    JSONB definicao\n    TIMESTAMP criado_em\n  }\n  FEATURE {\n    UUID feature_id PK\n    UUID feature_set_id FK\n    VARCHAR nome\n    VARCHAR tipo_dado\n    TEXT descricao\n  }\n  LINHAGEM_DADOS {\n    UUID linhagem_id PK\n    UUID versao_dataset_origem_id FK\n    UUID versao_dataset_destino_id FK\n    UUID transformacao_id FK\n    TIMESTAMP registrado_em\n  }\n\n  EXPERIMENTO {\n    UUID experimento_id PK\n    UUID projeto_id FK\n    UUID criado_por FK\n    VARCHAR nome\n    TEXT descricao\n    TIMESTAMP criado_em\n  }\n  EXECUCAO_EXPERIMENTO {\n    UUID execucao_experimento_id PK\n    UUID experimento_id FK\n    UUID versao_dataset_id FK\n    UUID feature_set_id FK\n    JSONB hiperparametros\n    JSONB metricas\n    VARCHAR status\n    TIMESTAMP iniciada_em\n  }\n  ARTEFATO_MODELO {\n    UUID artefato_modelo_id PK\n    UUID execucao_experimento_id FK\n    VARCHAR uri\n    VARCHAR formato\n    BIGINT tamanho_bytes\n    TIMESTAMP criado_em\n  }\n  MODELO {\n    UUID modelo_id PK\n    UUID projeto_id FK\n    UUID experimento_id FK\n    VARCHAR nome\n    VARCHAR tarefa\n    TIMESTAMP criado_em\n  }\n  VERSAO_MODELO {\n    UUID versao_modelo_id PK\n    UUID modelo_id FK\n    UUID artefato_modelo_id FK\n    VARCHAR numero_versao\n    VARCHAR estagio\n    JSONB metricas\n    TIMESTAMP registrado_em\n  }\n  AVALIACAO_MODELO {\n    UUID avaliacao_id PK\n    UUID versao_modelo_id FK\n    UUID versao_dataset_id FK\n    JSONB metricas\n    VARCHAR resultado\n    TIMESTAMP avaliado_em\n  }\n\n  MODELO_LLM {\n    UUID modelo_llm_id PK\n    UUID projeto_id FK\n    VARCHAR provedor\n    VARCHAR nome\n    VARCHAR versao\n    INT limite_contexto\n  }\n  PROMPT {\n    UUID prompt_id PK\n    UUID projeto_id FK\n    UUID criado_por FK\n    VARCHAR nome\n    TEXT descricao\n    TIMESTAMP criado_em\n  }\n  VERSAO_PROMPT {\n    UUID versao_prompt_id PK\n    UUID prompt_id FK\n    INT numero_versao\n    TEXT template\n    JSONB variaveis\n    TIMESTAMP criada_em\n  }\n  EXECUCAO_PROMPT {\n    UUID execucao_prompt_id PK\n    UUID versao_prompt_id FK\n    UUID modelo_llm_id FK\n    UUID usuario_id FK\n    JSONB entrada\n    TEXT saida\n    INT tokens_entrada\n    INT tokens_saida\n    TIMESTAMP executada_em\n  }\n  BASE_CONHECIMENTO {\n    UUID base_conhecimento_id PK\n    UUID projeto_id FK\n    VARCHAR nome\n    VARCHAR estrategia_divisao\n    TIMESTAMP criada_em\n  }\n  DOCUMENTO_CONHECIMENTO {\n    UUID documento_id PK\n    UUID base_conhecimento_id FK\n    UUID versao_dataset_id FK\n    VARCHAR uri\n    JSONB metadados\n    TIMESTAMP indexado_em\n  }\n  EMBEDDING {\n    UUID embedding_id PK\n    UUID documento_id FK\n    VARCHAR modelo_embedding\n    VECTOR vetor\n    TIMESTAMP criado_em\n  }\n  CONVERSA {\n    UUID conversa_id PK\n    UUID usuario_id FK\n    UUID projeto_id FK\n    TIMESTAMP iniciada_em\n    TIMESTAMP encerrada_em\n  }\n  MENSAGEM {\n    UUID mensagem_id PK\n    UUID conversa_id FK\n    UUID execucao_prompt_id FK\n    VARCHAR papel\n    TEXT conteudo\n    TIMESTAMP criada_em\n  }\n\n  PIPELINE {\n    UUID pipeline_id PK\n    UUID projeto_id FK\n    UUID criado_por FK\n    VARCHAR nome\n    JSONB definicao\n    TIMESTAMP criado_em\n  }\n  ETAPA_PIPELINE {\n    UUID etapa_pipeline_id PK\n    UUID pipeline_id FK\n    VARCHAR nome\n    VARCHAR tipo\n    JSONB configuracao\n    INT ordem\n  }\n  EXECUCAO_PIPELINE {\n    UUID execucao_pipeline_id PK\n    UUID pipeline_id FK\n    VARCHAR status\n    TIMESTAMP iniciada_em\n    TIMESTAMP concluida_em\n  }\n  EXECUCAO_ETAPA {\n    UUID execucao_etapa_id PK\n    UUID execucao_pipeline_id FK\n    UUID etapa_pipeline_id FK\n    VARCHAR status\n    JSONB resultado\n    TIMESTAMP iniciada_em\n    TIMESTAMP concluida_em\n  }\n  AMBIENTE_DEPLOY {\n    UUID ambiente_id PK\n    UUID projeto_id FK\n    VARCHAR nome\n    VARCHAR tipo\n    VARCHAR regiao\n  }\n  DEPLOYMENT {\n    UUID deployment_id PK\n    UUID ambiente_id FK\n    UUID versao_modelo_id FK\n    UUID executado_por FK\n    VARCHAR status\n    VARCHAR endpoint\n    TIMESTAMP implantado_em\n  }\n  ENDPOINT_MODELO {\n    UUID endpoint_id PK\n    UUID deployment_id FK\n    VARCHAR uri\n    VARCHAR metodo\n    BOOLEAN ativo\n  }\n  POLITICA_GOVERNANCA {\n    UUID politica_id PK\n    UUID projeto_id FK\n    VARCHAR nome\n    TEXT descricao\n    JSONB regras\n    TIMESTAMP criada_em\n  }\n  REVISAO_GOVERNANCA {\n    UUID revisao_id PK\n    UUID politica_id FK\n    UUID versao_modelo_id FK\n    UUID revisor_id FK\n    VARCHAR resultado\n    TEXT observacoes\n    TIMESTAMP revisada_em\n  }\n\n  METRICA_MONITORAMENTO {\n    UUID metrica_id PK\n    UUID deployment_id FK\n    VARCHAR nome\n    FLOAT valor\n    TIMESTAMP coletada_em\n  }\n  ALERTA {\n    UUID alerta_id PK\n    UUID deployment_id FK\n    VARCHAR severidade\n    TEXT mensagem\n    TIMESTAMP disparado_em\n    TIMESTAMP resolvido_em\n  }\n  REGISTRO_AUDITORIA {\n    UUID auditoria_id PK\n    UUID usuario_id FK\n    UUID projeto_id FK\n    VARCHAR acao\n    JSONB detalhes\n    TIMESTAMP ocorrido_em\n  }\n  REGISTRO_LOG {\n    UUID log_id PK\n    UUID execucao_pipeline_id FK\n    UUID execucao_prompt_id FK\n    VARCHAR nivel\n    TEXT mensagem\n    TIMESTAMP ocorrido_em\n  }\n  PLANO_FATURAMENTO {\n    UUID plano_id PK\n    VARCHAR nome\n    DECIMAL preco_mensal\n    JSONB limites\n  }\n  ASSINATURA {\n    UUID assinatura_id PK\n    UUID projeto_id FK\n    UUID plano_id FK\n    VARCHAR status\n    TIMESTAMP inicio_em\n    TIMESTAMP fim_em\n  }\n  USO_TOKEN {\n    UUID uso_token_id PK\n    UUID execucao_prompt_id FK\n    UUID assinatura_id FK\n    INT tokens_entrada\n    INT tokens_saida\n    DECIMAL custo\n    TIMESTAMP registrado_em\n  }\n  FATURA {\n    UUID fatura_id PK\n    UUID assinatura_id FK\n    VARCHAR numero UK\n    DECIMAL total\n    VARCHAR status\n    DATE vencimento\n    TIMESTAMP emitida_em\n  }\n\n  USUARIO ||--o{ USUARIO_PAPEL : recebe\n  PAPEL ||--o{ USUARIO_PAPEL : atribuido\n  PAPEL ||--o{ PAPEL_PERMISSAO : inclui\n  PERMISSAO ||--o{ PAPEL_PERMISSAO : concedida\n  USUARIO ||--o{ PROJETO : cria\n  PROJETO ||--o{ MEMBRO_PROJETO : possui\n  USUARIO ||--o{ MEMBRO_PROJETO : participa\n  PROJETO ||--o{ SEGREDO_CREDENCIAL : configura\n  PROJETO ||--o{ DATASET : possui\n  USUARIO ||--o{ DATASET : cria\n  DATASET ||--o{ VERSAO_DATASET : versionado\n  PROJETO ||--o{ FONTE_DADOS : possui\n  FONTE_DADOS ||--o{ CONECTOR_DADOS : usa\n  FONTE_DADOS ||--o{ EXECUCAO_INGESTAO : processada\n  VERSAO_DATASET o|--o{ EXECUCAO_INGESTAO : produz\n  PROJETO ||--o{ TRANSFORMACAO_DADOS : possui\n  TRANSFORMACAO_DADOS ||--o{ EXECUCAO_TRANSFORMACAO : executada\n  VERSAO_DATASET ||--o{ EXECUCAO_TRANSFORMACAO : entrada\n  VERSAO_DATASET ||--o{ EXECUCAO_TRANSFORMACAO : saida\n  PROJETO ||--o{ FEATURE_SET : possui\n  FEATURE_SET ||--o{ FEATURE : contem\n  VERSAO_DATASET ||--o{ LINHAGEM_DADOS : origem\n  VERSAO_DATASET ||--o{ LINHAGEM_DADOS : destino\n  TRANSFORMACAO_DADOS o|--o{ LINHAGEM_DADOS : explica\n  PROJETO ||--o{ EXPERIMENTO : possui\n  USUARIO ||--o{ EXPERIMENTO : cria\n  EXPERIMENTO ||--o{ EXECUCAO_EXPERIMENTO : contem\n  VERSAO_DATASET ||--o{ EXECUCAO_EXPERIMENTO : treina_com\n  FEATURE_SET o|--o{ EXECUCAO_EXPERIMENTO : usa\n  EXECUCAO_EXPERIMENTO ||--o{ ARTEFATO_MODELO : gera\n  PROJETO ||--o{ MODELO : possui\n  EXPERIMENTO o|--o{ MODELO : origina\n  MODELO ||--o{ VERSAO_MODELO : versionado\n  ARTEFATO_MODELO ||--o{ VERSAO_MODELO : empacotado\n  VERSAO_MODELO ||--o{ AVALIACAO_MODELO : avaliado\n  VERSAO_DATASET ||--o{ AVALIACAO_MODELO : avaliado_com\n  PROJETO ||--o{ MODELO_LLM : disponibiliza\n  PROJETO ||--o{ PROMPT : possui\n  USUARIO ||--o{ PROMPT : cria\n  PROMPT ||--o{ VERSAO_PROMPT : versionado\n  VERSAO_PROMPT ||--o{ EXECUCAO_PROMPT : executado\n  MODELO_LLM ||--o{ EXECUCAO_PROMPT : atende\n  USUARIO ||--o{ EXECUCAO_PROMPT : solicita\n  PROJETO ||--o{ BASE_CONHECIMENTO : possui\n  BASE_CONHECIMENTO ||--o{ DOCUMENTO_CONHECIMENTO : contem\n  VERSAO_DATASET o|--o{ DOCUMENTO_CONHECIMENTO : fornece\n  DOCUMENTO_CONHECIMENTO ||--o{ EMBEDDING : vetorizado\n  USUARIO ||--o{ CONVERSA : inicia\n  PROJETO ||--o{ CONVERSA : organiza\n  CONVERSA ||--o{ MENSAGEM : contem\n  EXECUCAO_PROMPT o|--o{ MENSAGEM : fundamenta\n  PROJETO ||--o{ PIPELINE : possui\n  USUARIO ||--o{ PIPELINE : cria\n  PIPELINE ||--o{ ETAPA_PIPELINE : define\n  PIPELINE ||--o{ EXECUCAO_PIPELINE : executado\n  EXECUCAO_PIPELINE ||--o{ EXECUCAO_ETAPA : contem\n  ETAPA_PIPELINE ||--o{ EXECUCAO_ETAPA : processada\n  PROJETO ||--o{ AMBIENTE_DEPLOY : possui\n  AMBIENTE_DEPLOY ||--o{ DEPLOYMENT : hospeda\n  VERSAO_MODELO ||--o{ DEPLOYMENT : implantada\n  USUARIO ||--o{ DEPLOYMENT : aprova\n  DEPLOYMENT ||--o{ ENDPOINT_MODELO : expoe\n  PROJETO ||--o{ POLITICA_GOVERNANCA : rege\n  POLITICA_GOVERNANCA ||--o{ REVISAO_GOVERNANCA : aplicada\n  VERSAO_MODELO ||--o{ REVISAO_GOVERNANCA : revisada\n  USUARIO ||--o{ REVISAO_GOVERNANCA : revisa\n  DEPLOYMENT ||--o{ METRICA_MONITORAMENTO : medido\n  DEPLOYMENT ||--o{ ALERTA : gera\n  USUARIO ||--o{ REGISTRO_AUDITORIA : executa\n  PROJETO ||--o{ REGISTRO_AUDITORIA : registra\n  EXECUCAO_PIPELINE o|--o{ REGISTRO_LOG : produz\n  EXECUCAO_PROMPT o|--o{ REGISTRO_LOG : produz\n  PROJETO ||--o{ ASSINATURA : contrata\n  PLANO_FATURAMENTO ||--o{ ASSINATURA : contratado\n  ASSINATURA ||--o{ USO_TOKEN : contabiliza\n  EXECUCAO_PROMPT ||--o{ USO_TOKEN : consome\n  ASSINATURA ||--o{ FATURA : fatura&quot;,&#xa;  &quot;config&quot;: null,&#xa;  &quot;version&quot;: &quot;12&quot;&#xa;}" id="mmNIjh_8eKnvHOKM7R7M-1">
          <mxCell connectable="0" parent="1" style="group;transparentBounds=1;editIcon=1;lockedGroup=0;groupPadding=10;" vertex="1">
            <mxGeometry as="geometry" />
          </mxCell>
        </UserObject>
        <UserObject label="USUARIO" mermaidId="n:USUARIO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FDF4FF;strokeColor=#E879F9;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="USUARIO" id="mmNIjh_8eKnvHOKM7R7M-2">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FDF4FF;strokeColor=#E879F9;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="244" x="5151" y="130" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-3" parent="mmNIjh_8eKnvHOKM7R7M-2" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-4" parent="mmNIjh_8eKnvHOKM7R7M-3" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-5" parent="mmNIjh_8eKnvHOKM7R7M-3" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="usuario_id" vertex="1">
          <mxGeometry height="40" width="98" x="103" as="geometry">
            <mxRectangle height="40" width="98" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-6" parent="mmNIjh_8eKnvHOKM7R7M-3" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="43" x="201" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-7" parent="mmNIjh_8eKnvHOKM7R7M-2" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-8" parent="mmNIjh_8eKnvHOKM7R7M-7" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-9" parent="mmNIjh_8eKnvHOKM7R7M-7" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="email" vertex="1">
          <mxGeometry height="40" width="98" x="103" as="geometry">
            <mxRectangle height="40" width="98" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-10" parent="mmNIjh_8eKnvHOKM7R7M-7" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UK" vertex="1">
          <mxGeometry height="40" width="43" x="201" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-11" parent="mmNIjh_8eKnvHOKM7R7M-2" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-12" parent="mmNIjh_8eKnvHOKM7R7M-11" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-13" parent="mmNIjh_8eKnvHOKM7R7M-11" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="98" x="103" as="geometry">
            <mxRectangle height="40" width="98" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-14" parent="mmNIjh_8eKnvHOKM7R7M-11" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="43" x="201" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-15" parent="mmNIjh_8eKnvHOKM7R7M-2" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-16" parent="mmNIjh_8eKnvHOKM7R7M-15" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-17" parent="mmNIjh_8eKnvHOKM7R7M-15" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="status" vertex="1">
          <mxGeometry height="40" width="98" x="103" as="geometry">
            <mxRectangle height="40" width="98" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-18" parent="mmNIjh_8eKnvHOKM7R7M-15" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="43" x="201" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-19" parent="mmNIjh_8eKnvHOKM7R7M-2" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-20" parent="mmNIjh_8eKnvHOKM7R7M-19" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-21" parent="mmNIjh_8eKnvHOKM7R7M-19" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_em" vertex="1">
          <mxGeometry height="40" width="98" x="103" as="geometry">
            <mxRectangle height="40" width="98" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-22" parent="mmNIjh_8eKnvHOKM7R7M-19" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="43" x="201" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="PAPEL" mermaidId="n:PAPEL" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="PAPEL" id="mmNIjh_8eKnvHOKM7R7M-23">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="159" width="220" x="5934" y="210" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-24" parent="mmNIjh_8eKnvHOKM7R7M-23" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="220" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-25" parent="mmNIjh_8eKnvHOKM7R7M-24" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-26" parent="mmNIjh_8eKnvHOKM7R7M-24" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="papel_id" vertex="1">
          <mxGeometry height="40" width="92" x="86" as="geometry">
            <mxRectangle height="40" width="92" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-27" parent="mmNIjh_8eKnvHOKM7R7M-24" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="178" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-28" parent="mmNIjh_8eKnvHOKM7R7M-23" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="220" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-29" parent="mmNIjh_8eKnvHOKM7R7M-28" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-30" parent="mmNIjh_8eKnvHOKM7R7M-28" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="92" x="86" as="geometry">
            <mxRectangle height="40" width="92" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-31" parent="mmNIjh_8eKnvHOKM7R7M-28" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="178" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-32" parent="mmNIjh_8eKnvHOKM7R7M-23" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="220" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-33" parent="mmNIjh_8eKnvHOKM7R7M-32" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-34" parent="mmNIjh_8eKnvHOKM7R7M-32" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="descricao" vertex="1">
          <mxGeometry height="40" width="92" x="86" as="geometry">
            <mxRectangle height="40" width="92" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-35" parent="mmNIjh_8eKnvHOKM7R7M-32" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="178" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="PERMISSAO" mermaidId="n:PERMISSAO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF7ED;strokeColor=#FB923C;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="PERMISSAO" id="mmNIjh_8eKnvHOKM7R7M-36">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF7ED;strokeColor=#FB923C;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="159" width="247" x="6440" y="210" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-37" parent="mmNIjh_8eKnvHOKM7R7M-36" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="247" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-38" parent="mmNIjh_8eKnvHOKM7R7M-37" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-39" parent="mmNIjh_8eKnvHOKM7R7M-37" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="permissao_id" vertex="1">
          <mxGeometry height="40" width="118" x="86" as="geometry">
            <mxRectangle height="40" width="118" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-40" parent="mmNIjh_8eKnvHOKM7R7M-37" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="43" x="204" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-41" parent="mmNIjh_8eKnvHOKM7R7M-36" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="247" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-42" parent="mmNIjh_8eKnvHOKM7R7M-41" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-43" parent="mmNIjh_8eKnvHOKM7R7M-41" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="codigo" vertex="1">
          <mxGeometry height="40" width="118" x="86" as="geometry">
            <mxRectangle height="40" width="118" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-44" parent="mmNIjh_8eKnvHOKM7R7M-41" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UK" vertex="1">
          <mxGeometry height="40" width="43" x="204" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-45" parent="mmNIjh_8eKnvHOKM7R7M-36" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="247" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-46" parent="mmNIjh_8eKnvHOKM7R7M-45" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-47" parent="mmNIjh_8eKnvHOKM7R7M-45" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="descricao" vertex="1">
          <mxGeometry height="40" width="118" x="86" as="geometry">
            <mxRectangle height="40" width="118" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-48" parent="mmNIjh_8eKnvHOKM7R7M-45" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="43" x="204" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="USUARIO_PAPEL" mermaidId="n:USUARIO_PAPEL" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#ECFEFF;strokeColor=#22D3EE;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="USUARIO_PAPEL" id="mmNIjh_8eKnvHOKM7R7M-49">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#ECFEFF;strokeColor=#22D3EE;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="199" width="289" x="5740" y="590" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-50" parent="mmNIjh_8eKnvHOKM7R7M-49" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="289" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-51" parent="mmNIjh_8eKnvHOKM7R7M-50" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-52" parent="mmNIjh_8eKnvHOKM7R7M-50" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="usuario_papel_id" vertex="1">
          <mxGeometry height="40" width="144" x="103" as="geometry">
            <mxRectangle height="40" width="144" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-53" parent="mmNIjh_8eKnvHOKM7R7M-50" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="247" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-54" parent="mmNIjh_8eKnvHOKM7R7M-49" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="289" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-55" parent="mmNIjh_8eKnvHOKM7R7M-54" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-56" parent="mmNIjh_8eKnvHOKM7R7M-54" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="usuario_id" vertex="1">
          <mxGeometry height="40" width="144" x="103" as="geometry">
            <mxRectangle height="40" width="144" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-57" parent="mmNIjh_8eKnvHOKM7R7M-54" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="247" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-58" parent="mmNIjh_8eKnvHOKM7R7M-49" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="289" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-59" parent="mmNIjh_8eKnvHOKM7R7M-58" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-60" parent="mmNIjh_8eKnvHOKM7R7M-58" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="papel_id" vertex="1">
          <mxGeometry height="40" width="144" x="103" as="geometry">
            <mxRectangle height="40" width="144" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-61" parent="mmNIjh_8eKnvHOKM7R7M-58" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="247" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-62" parent="mmNIjh_8eKnvHOKM7R7M-49" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="289" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-63" parent="mmNIjh_8eKnvHOKM7R7M-62" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-64" parent="mmNIjh_8eKnvHOKM7R7M-62" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="atribuido_em" vertex="1">
          <mxGeometry height="40" width="144" x="103" as="geometry">
            <mxRectangle height="40" width="144" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-65" parent="mmNIjh_8eKnvHOKM7R7M-62" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="247" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="PAPEL_PERMISSAO" mermaidId="n:PAPEL_PERMISSAO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDF4;strokeColor=#4ADE80;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="PAPEL_PERMISSAO" id="mmNIjh_8eKnvHOKM7R7M-66">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDF4;strokeColor=#4ADE80;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="159" width="265" x="6462" y="590" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-67" parent="mmNIjh_8eKnvHOKM7R7M-66" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="265" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-68" parent="mmNIjh_8eKnvHOKM7R7M-67" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="59" as="geometry">
            <mxRectangle height="40" width="59" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-69" parent="mmNIjh_8eKnvHOKM7R7M-67" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="papel_permissao_id" vertex="1">
          <mxGeometry height="40" width="164" x="59" as="geometry">
            <mxRectangle height="40" width="164" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-70" parent="mmNIjh_8eKnvHOKM7R7M-67" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="223" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-71" parent="mmNIjh_8eKnvHOKM7R7M-66" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="265" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-72" parent="mmNIjh_8eKnvHOKM7R7M-71" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="59" as="geometry">
            <mxRectangle height="40" width="59" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-73" parent="mmNIjh_8eKnvHOKM7R7M-71" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="papel_id" vertex="1">
          <mxGeometry height="40" width="164" x="59" as="geometry">
            <mxRectangle height="40" width="164" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-74" parent="mmNIjh_8eKnvHOKM7R7M-71" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="223" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-75" parent="mmNIjh_8eKnvHOKM7R7M-66" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="265" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-76" parent="mmNIjh_8eKnvHOKM7R7M-75" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="59" as="geometry">
            <mxRectangle height="40" width="59" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-77" parent="mmNIjh_8eKnvHOKM7R7M-75" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="permissao_id" vertex="1">
          <mxGeometry height="40" width="164" x="59" as="geometry">
            <mxRectangle height="40" width="164" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-78" parent="mmNIjh_8eKnvHOKM7R7M-75" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="223" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="PROJETO" mermaidId="n:PROJETO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F5F3FF;strokeColor=#A78BFA;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="PROJETO" id="mmNIjh_8eKnvHOKM7R7M-79">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F5F3FF;strokeColor=#A78BFA;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="244" x="3659" y="590" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-80" parent="mmNIjh_8eKnvHOKM7R7M-79" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-81" parent="mmNIjh_8eKnvHOKM7R7M-80" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-82" parent="mmNIjh_8eKnvHOKM7R7M-80" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-83" parent="mmNIjh_8eKnvHOKM7R7M-80" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-84" parent="mmNIjh_8eKnvHOKM7R7M-79" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-85" parent="mmNIjh_8eKnvHOKM7R7M-84" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-86" parent="mmNIjh_8eKnvHOKM7R7M-84" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-87" parent="mmNIjh_8eKnvHOKM7R7M-84" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-88" parent="mmNIjh_8eKnvHOKM7R7M-79" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-89" parent="mmNIjh_8eKnvHOKM7R7M-88" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-90" parent="mmNIjh_8eKnvHOKM7R7M-88" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="descricao" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-91" parent="mmNIjh_8eKnvHOKM7R7M-88" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-92" parent="mmNIjh_8eKnvHOKM7R7M-79" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-93" parent="mmNIjh_8eKnvHOKM7R7M-92" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-94" parent="mmNIjh_8eKnvHOKM7R7M-92" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_por" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-95" parent="mmNIjh_8eKnvHOKM7R7M-92" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-96" parent="mmNIjh_8eKnvHOKM7R7M-79" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-97" parent="mmNIjh_8eKnvHOKM7R7M-96" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-98" parent="mmNIjh_8eKnvHOKM7R7M-96" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_em" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-99" parent="mmNIjh_8eKnvHOKM7R7M-96" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="MEMBRO_PROJETO" mermaidId="n:MEMBRO_PROJETO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEF2F2;strokeColor=#F87171;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="MEMBRO_PROJETO" id="mmNIjh_8eKnvHOKM7R7M-100">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEF2F2;strokeColor=#F87171;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="305" x="4759" y="1089" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-101" parent="mmNIjh_8eKnvHOKM7R7M-100" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="305" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-102" parent="mmNIjh_8eKnvHOKM7R7M-101" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-103" parent="mmNIjh_8eKnvHOKM7R7M-101" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="membro_projeto_id" vertex="1">
          <mxGeometry height="40" width="160" x="103" as="geometry">
            <mxRectangle height="40" width="160" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-104" parent="mmNIjh_8eKnvHOKM7R7M-101" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="263" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-105" parent="mmNIjh_8eKnvHOKM7R7M-100" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="305" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-106" parent="mmNIjh_8eKnvHOKM7R7M-105" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-107" parent="mmNIjh_8eKnvHOKM7R7M-105" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="160" x="103" as="geometry">
            <mxRectangle height="40" width="160" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-108" parent="mmNIjh_8eKnvHOKM7R7M-105" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="263" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-109" parent="mmNIjh_8eKnvHOKM7R7M-100" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="305" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-110" parent="mmNIjh_8eKnvHOKM7R7M-109" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-111" parent="mmNIjh_8eKnvHOKM7R7M-109" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="usuario_id" vertex="1">
          <mxGeometry height="40" width="160" x="103" as="geometry">
            <mxRectangle height="40" width="160" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-112" parent="mmNIjh_8eKnvHOKM7R7M-109" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="263" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-113" parent="mmNIjh_8eKnvHOKM7R7M-100" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="305" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-114" parent="mmNIjh_8eKnvHOKM7R7M-113" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-115" parent="mmNIjh_8eKnvHOKM7R7M-113" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nivel_acesso" vertex="1">
          <mxGeometry height="40" width="160" x="103" as="geometry">
            <mxRectangle height="40" width="160" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-116" parent="mmNIjh_8eKnvHOKM7R7M-113" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="263" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-117" parent="mmNIjh_8eKnvHOKM7R7M-100" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="305" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-118" parent="mmNIjh_8eKnvHOKM7R7M-117" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-119" parent="mmNIjh_8eKnvHOKM7R7M-117" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="adicionado_em" vertex="1">
          <mxGeometry height="40" width="160" x="103" as="geometry">
            <mxRectangle height="40" width="160" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-120" parent="mmNIjh_8eKnvHOKM7R7M-117" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="263" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="SEGREDO_CREDENCIAL" mermaidId="n:SEGREDO_CREDENCIAL" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEFCE8;strokeColor=#FACC15;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="SEGREDO_CREDENCIAL" id="mmNIjh_8eKnvHOKM7R7M-121">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEFCE8;strokeColor=#FACC15;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="302" x="2280" y="1089" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-122" parent="mmNIjh_8eKnvHOKM7R7M-121" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="302" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-123" parent="mmNIjh_8eKnvHOKM7R7M-122" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-124" parent="mmNIjh_8eKnvHOKM7R7M-122" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="segredo_id" vertex="1">
          <mxGeometry height="40" width="157" x="103" as="geometry">
            <mxRectangle height="40" width="157" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-125" parent="mmNIjh_8eKnvHOKM7R7M-122" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="260" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-126" parent="mmNIjh_8eKnvHOKM7R7M-121" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="302" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-127" parent="mmNIjh_8eKnvHOKM7R7M-126" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-128" parent="mmNIjh_8eKnvHOKM7R7M-126" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="157" x="103" as="geometry">
            <mxRectangle height="40" width="157" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-129" parent="mmNIjh_8eKnvHOKM7R7M-126" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="260" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-130" parent="mmNIjh_8eKnvHOKM7R7M-121" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="302" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-131" parent="mmNIjh_8eKnvHOKM7R7M-130" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-132" parent="mmNIjh_8eKnvHOKM7R7M-130" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="provedor" vertex="1">
          <mxGeometry height="40" width="157" x="103" as="geometry">
            <mxRectangle height="40" width="157" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-133" parent="mmNIjh_8eKnvHOKM7R7M-130" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="260" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-134" parent="mmNIjh_8eKnvHOKM7R7M-121" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="302" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-135" parent="mmNIjh_8eKnvHOKM7R7M-134" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-136" parent="mmNIjh_8eKnvHOKM7R7M-134" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="referencia_secreta" vertex="1">
          <mxGeometry height="40" width="157" x="103" as="geometry">
            <mxRectangle height="40" width="157" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-137" parent="mmNIjh_8eKnvHOKM7R7M-134" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="260" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-138" parent="mmNIjh_8eKnvHOKM7R7M-121" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="302" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-139" parent="mmNIjh_8eKnvHOKM7R7M-138" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-140" parent="mmNIjh_8eKnvHOKM7R7M-138" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="atualizado_em" vertex="1">
          <mxGeometry height="40" width="157" x="103" as="geometry">
            <mxRectangle height="40" width="157" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-141" parent="mmNIjh_8eKnvHOKM7R7M-138" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="260" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="DATASET" mermaidId="n:DATASET" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#EEF2FF;strokeColor=#818CF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="DATASET" id="mmNIjh_8eKnvHOKM7R7M-142">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#EEF2FF;strokeColor=#818CF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="319" width="308" x="1422" y="1089" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-143" parent="mmNIjh_8eKnvHOKM7R7M-142" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="308" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-144" parent="mmNIjh_8eKnvHOKM7R7M-143" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-145" parent="mmNIjh_8eKnvHOKM7R7M-143" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="dataset_id" vertex="1">
          <mxGeometry height="40" width="163" x="103" as="geometry">
            <mxRectangle height="40" width="163" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-146" parent="mmNIjh_8eKnvHOKM7R7M-143" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="266" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-147" parent="mmNIjh_8eKnvHOKM7R7M-142" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="308" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-148" parent="mmNIjh_8eKnvHOKM7R7M-147" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-149" parent="mmNIjh_8eKnvHOKM7R7M-147" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="163" x="103" as="geometry">
            <mxRectangle height="40" width="163" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-150" parent="mmNIjh_8eKnvHOKM7R7M-147" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="266" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-151" parent="mmNIjh_8eKnvHOKM7R7M-142" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="308" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-152" parent="mmNIjh_8eKnvHOKM7R7M-151" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-153" parent="mmNIjh_8eKnvHOKM7R7M-151" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_por" vertex="1">
          <mxGeometry height="40" width="163" x="103" as="geometry">
            <mxRectangle height="40" width="163" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-154" parent="mmNIjh_8eKnvHOKM7R7M-151" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="266" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-155" parent="mmNIjh_8eKnvHOKM7R7M-142" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="308" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-156" parent="mmNIjh_8eKnvHOKM7R7M-155" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-157" parent="mmNIjh_8eKnvHOKM7R7M-155" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="163" x="103" as="geometry">
            <mxRectangle height="40" width="163" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-158" parent="mmNIjh_8eKnvHOKM7R7M-155" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="266" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-159" parent="mmNIjh_8eKnvHOKM7R7M-142" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="308" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-160" parent="mmNIjh_8eKnvHOKM7R7M-159" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-161" parent="mmNIjh_8eKnvHOKM7R7M-159" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="descricao" vertex="1">
          <mxGeometry height="40" width="163" x="103" as="geometry">
            <mxRectangle height="40" width="163" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-162" parent="mmNIjh_8eKnvHOKM7R7M-159" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="266" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-163" parent="mmNIjh_8eKnvHOKM7R7M-142" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="308" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-164" parent="mmNIjh_8eKnvHOKM7R7M-163" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-165" parent="mmNIjh_8eKnvHOKM7R7M-163" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="uri_armazenamento" vertex="1">
          <mxGeometry height="40" width="163" x="103" as="geometry">
            <mxRectangle height="40" width="163" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-166" parent="mmNIjh_8eKnvHOKM7R7M-163" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="266" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-167" parent="mmNIjh_8eKnvHOKM7R7M-142" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="308" y="279" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-168" parent="mmNIjh_8eKnvHOKM7R7M-167" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-169" parent="mmNIjh_8eKnvHOKM7R7M-167" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_em" vertex="1">
          <mxGeometry height="40" width="163" x="103" as="geometry">
            <mxRectangle height="40" width="163" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-170" parent="mmNIjh_8eKnvHOKM7R7M-167" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="266" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="VERSAO_DATASET" mermaidId="n:VERSAO_DATASET" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F7FEE7;strokeColor=#A3E635;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="VERSAO_DATASET" id="mmNIjh_8eKnvHOKM7R7M-171">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F7FEE7;strokeColor=#A3E635;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="300" x="1218" y="1781" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-172" parent="mmNIjh_8eKnvHOKM7R7M-171" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-173" parent="mmNIjh_8eKnvHOKM7R7M-172" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-174" parent="mmNIjh_8eKnvHOKM7R7M-172" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_dataset_id" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-175" parent="mmNIjh_8eKnvHOKM7R7M-172" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-176" parent="mmNIjh_8eKnvHOKM7R7M-171" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-177" parent="mmNIjh_8eKnvHOKM7R7M-176" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-178" parent="mmNIjh_8eKnvHOKM7R7M-176" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="dataset_id" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-179" parent="mmNIjh_8eKnvHOKM7R7M-176" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-180" parent="mmNIjh_8eKnvHOKM7R7M-171" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-181" parent="mmNIjh_8eKnvHOKM7R7M-180" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-182" parent="mmNIjh_8eKnvHOKM7R7M-180" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="rotulo_versao" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-183" parent="mmNIjh_8eKnvHOKM7R7M-180" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-184" parent="mmNIjh_8eKnvHOKM7R7M-171" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-185" parent="mmNIjh_8eKnvHOKM7R7M-184" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-186" parent="mmNIjh_8eKnvHOKM7R7M-184" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="esquema" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-187" parent="mmNIjh_8eKnvHOKM7R7M-184" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-188" parent="mmNIjh_8eKnvHOKM7R7M-171" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-189" parent="mmNIjh_8eKnvHOKM7R7M-188" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="INT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-190" parent="mmNIjh_8eKnvHOKM7R7M-188" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="numero_registros" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-191" parent="mmNIjh_8eKnvHOKM7R7M-188" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-192" parent="mmNIjh_8eKnvHOKM7R7M-171" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-193" parent="mmNIjh_8eKnvHOKM7R7M-192" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-194" parent="mmNIjh_8eKnvHOKM7R7M-192" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_em" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-195" parent="mmNIjh_8eKnvHOKM7R7M-192" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="FONTE_DADOS" mermaidId="n:FONTE_DADOS" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0F9FF;strokeColor=#38BDF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="FONTE_DADOS" id="mmNIjh_8eKnvHOKM7R7M-196">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0F9FF;strokeColor=#38BDF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="276" x="1106" y="1116" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-197" parent="mmNIjh_8eKnvHOKM7R7M-196" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="276" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-198" parent="mmNIjh_8eKnvHOKM7R7M-197" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-199" parent="mmNIjh_8eKnvHOKM7R7M-197" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="fonte_dados_id" vertex="1">
          <mxGeometry height="40" width="131" x="103" as="geometry">
            <mxRectangle height="40" width="131" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-200" parent="mmNIjh_8eKnvHOKM7R7M-197" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="234" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-201" parent="mmNIjh_8eKnvHOKM7R7M-196" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="276" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-202" parent="mmNIjh_8eKnvHOKM7R7M-201" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-203" parent="mmNIjh_8eKnvHOKM7R7M-201" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="131" x="103" as="geometry">
            <mxRectangle height="40" width="131" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-204" parent="mmNIjh_8eKnvHOKM7R7M-201" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="234" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-205" parent="mmNIjh_8eKnvHOKM7R7M-196" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="276" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-206" parent="mmNIjh_8eKnvHOKM7R7M-205" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-207" parent="mmNIjh_8eKnvHOKM7R7M-205" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="tipo_fonte" vertex="1">
          <mxGeometry height="40" width="131" x="103" as="geometry">
            <mxRectangle height="40" width="131" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-208" parent="mmNIjh_8eKnvHOKM7R7M-205" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="234" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-209" parent="mmNIjh_8eKnvHOKM7R7M-196" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="276" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-210" parent="mmNIjh_8eKnvHOKM7R7M-209" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-211" parent="mmNIjh_8eKnvHOKM7R7M-209" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="uri" vertex="1">
          <mxGeometry height="40" width="131" x="103" as="geometry">
            <mxRectangle height="40" width="131" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-212" parent="mmNIjh_8eKnvHOKM7R7M-209" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="234" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-213" parent="mmNIjh_8eKnvHOKM7R7M-196" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="276" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-214" parent="mmNIjh_8eKnvHOKM7R7M-213" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-215" parent="mmNIjh_8eKnvHOKM7R7M-213" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="configuracao" vertex="1">
          <mxGeometry height="40" width="131" x="103" as="geometry">
            <mxRectangle height="40" width="131" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-216" parent="mmNIjh_8eKnvHOKM7R7M-213" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="234" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-217" parent="mmNIjh_8eKnvHOKM7R7M-196" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="276" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-218" parent="mmNIjh_8eKnvHOKM7R7M-217" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-219" parent="mmNIjh_8eKnvHOKM7R7M-217" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criada_em" vertex="1">
          <mxGeometry height="40" width="131" x="103" as="geometry">
            <mxRectangle height="40" width="131" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-220" parent="mmNIjh_8eKnvHOKM7R7M-217" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="234" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="CONECTOR_DADOS" mermaidId="n:CONECTOR_DADOS" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF1F2;strokeColor=#FB7185;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="CONECTOR_DADOS" id="mmNIjh_8eKnvHOKM7R7M-221">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF1F2;strokeColor=#FB7185;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="259" x="1558" y="1746" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-222" parent="mmNIjh_8eKnvHOKM7R7M-221" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="259" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-223" parent="mmNIjh_8eKnvHOKM7R7M-222" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-224" parent="mmNIjh_8eKnvHOKM7R7M-222" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="conector_id" vertex="1">
          <mxGeometry height="40" width="131" x="86" as="geometry">
            <mxRectangle height="40" width="131" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-225" parent="mmNIjh_8eKnvHOKM7R7M-222" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="217" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-226" parent="mmNIjh_8eKnvHOKM7R7M-221" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="259" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-227" parent="mmNIjh_8eKnvHOKM7R7M-226" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-228" parent="mmNIjh_8eKnvHOKM7R7M-226" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="fonte_dados_id" vertex="1">
          <mxGeometry height="40" width="131" x="86" as="geometry">
            <mxRectangle height="40" width="131" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-229" parent="mmNIjh_8eKnvHOKM7R7M-226" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="217" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-230" parent="mmNIjh_8eKnvHOKM7R7M-221" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="259" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-231" parent="mmNIjh_8eKnvHOKM7R7M-230" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-232" parent="mmNIjh_8eKnvHOKM7R7M-230" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="tipo_conector" vertex="1">
          <mxGeometry height="40" width="131" x="86" as="geometry">
            <mxRectangle height="40" width="131" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-233" parent="mmNIjh_8eKnvHOKM7R7M-230" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="217" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-234" parent="mmNIjh_8eKnvHOKM7R7M-221" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="259" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-235" parent="mmNIjh_8eKnvHOKM7R7M-234" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-236" parent="mmNIjh_8eKnvHOKM7R7M-234" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="configuracao" vertex="1">
          <mxGeometry height="40" width="131" x="86" as="geometry">
            <mxRectangle height="40" width="131" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-237" parent="mmNIjh_8eKnvHOKM7R7M-234" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="217" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-238" parent="mmNIjh_8eKnvHOKM7R7M-221" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="259" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-239" parent="mmNIjh_8eKnvHOKM7R7M-238" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="BOOLEAN" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-240" parent="mmNIjh_8eKnvHOKM7R7M-238" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="ativo" vertex="1">
          <mxGeometry height="40" width="131" x="86" as="geometry">
            <mxRectangle height="40" width="131" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-241" parent="mmNIjh_8eKnvHOKM7R7M-238" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="217" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="EXECUCAO_INGESTAO" mermaidId="n:EXECUCAO_INGESTAO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FDF4FF;strokeColor=#E879F9;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="EXECUCAO_INGESTAO" id="mmNIjh_8eKnvHOKM7R7M-242">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FDF4FF;strokeColor=#E879F9;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="300" x="1101" y="2285" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-243" parent="mmNIjh_8eKnvHOKM7R7M-242" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-244" parent="mmNIjh_8eKnvHOKM7R7M-243" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-245" parent="mmNIjh_8eKnvHOKM7R7M-243" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="ingestao_id" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-246" parent="mmNIjh_8eKnvHOKM7R7M-243" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-247" parent="mmNIjh_8eKnvHOKM7R7M-242" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-248" parent="mmNIjh_8eKnvHOKM7R7M-247" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-249" parent="mmNIjh_8eKnvHOKM7R7M-247" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="fonte_dados_id" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-250" parent="mmNIjh_8eKnvHOKM7R7M-247" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-251" parent="mmNIjh_8eKnvHOKM7R7M-242" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-252" parent="mmNIjh_8eKnvHOKM7R7M-251" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-253" parent="mmNIjh_8eKnvHOKM7R7M-251" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_dataset_id" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-254" parent="mmNIjh_8eKnvHOKM7R7M-251" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-255" parent="mmNIjh_8eKnvHOKM7R7M-242" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-256" parent="mmNIjh_8eKnvHOKM7R7M-255" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-257" parent="mmNIjh_8eKnvHOKM7R7M-255" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="status" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-258" parent="mmNIjh_8eKnvHOKM7R7M-255" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-259" parent="mmNIjh_8eKnvHOKM7R7M-242" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-260" parent="mmNIjh_8eKnvHOKM7R7M-259" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-261" parent="mmNIjh_8eKnvHOKM7R7M-259" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="iniciada_em" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-262" parent="mmNIjh_8eKnvHOKM7R7M-259" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-263" parent="mmNIjh_8eKnvHOKM7R7M-242" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-264" parent="mmNIjh_8eKnvHOKM7R7M-263" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-265" parent="mmNIjh_8eKnvHOKM7R7M-263" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="concluida_em" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-266" parent="mmNIjh_8eKnvHOKM7R7M-263" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="TRANSFORMACAO_DADOS" mermaidId="n:TRANSFORMACAO_DADOS" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="TRANSFORMACAO_DADOS" id="mmNIjh_8eKnvHOKM7R7M-267">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="292" x="2071" y="1772" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-268" parent="mmNIjh_8eKnvHOKM7R7M-267" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="292" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-269" parent="mmNIjh_8eKnvHOKM7R7M-268" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-270" parent="mmNIjh_8eKnvHOKM7R7M-268" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="transformacao_id" vertex="1">
          <mxGeometry height="40" width="147" x="103" as="geometry">
            <mxRectangle height="40" width="147" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-271" parent="mmNIjh_8eKnvHOKM7R7M-268" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="250" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-272" parent="mmNIjh_8eKnvHOKM7R7M-267" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="292" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-273" parent="mmNIjh_8eKnvHOKM7R7M-272" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-274" parent="mmNIjh_8eKnvHOKM7R7M-272" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="147" x="103" as="geometry">
            <mxRectangle height="40" width="147" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-275" parent="mmNIjh_8eKnvHOKM7R7M-272" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="250" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-276" parent="mmNIjh_8eKnvHOKM7R7M-267" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="292" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-277" parent="mmNIjh_8eKnvHOKM7R7M-276" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-278" parent="mmNIjh_8eKnvHOKM7R7M-276" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="147" x="103" as="geometry">
            <mxRectangle height="40" width="147" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-279" parent="mmNIjh_8eKnvHOKM7R7M-276" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="250" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-280" parent="mmNIjh_8eKnvHOKM7R7M-267" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="292" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-281" parent="mmNIjh_8eKnvHOKM7R7M-280" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TEXT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-282" parent="mmNIjh_8eKnvHOKM7R7M-280" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="codigo" vertex="1">
          <mxGeometry height="40" width="147" x="103" as="geometry">
            <mxRectangle height="40" width="147" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-283" parent="mmNIjh_8eKnvHOKM7R7M-280" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="250" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-284" parent="mmNIjh_8eKnvHOKM7R7M-267" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="292" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-285" parent="mmNIjh_8eKnvHOKM7R7M-284" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-286" parent="mmNIjh_8eKnvHOKM7R7M-284" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="parametros" vertex="1">
          <mxGeometry height="40" width="147" x="103" as="geometry">
            <mxRectangle height="40" width="147" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-287" parent="mmNIjh_8eKnvHOKM7R7M-284" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="250" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-288" parent="mmNIjh_8eKnvHOKM7R7M-267" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="292" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-289" parent="mmNIjh_8eKnvHOKM7R7M-288" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-290" parent="mmNIjh_8eKnvHOKM7R7M-288" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criada_em" vertex="1">
          <mxGeometry height="40" width="147" x="103" as="geometry">
            <mxRectangle height="40" width="147" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-291" parent="mmNIjh_8eKnvHOKM7R7M-288" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="250" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="EXECUCAO_TRANSFORMACAO" mermaidId="n:EXECUCAO_TRANSFORMACAO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF7ED;strokeColor=#FB923C;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="EXECUCAO_TRANSFORMACAO" id="mmNIjh_8eKnvHOKM7R7M-292">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF7ED;strokeColor=#FB923C;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="363" x="1622" y="2285" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-293" parent="mmNIjh_8eKnvHOKM7R7M-292" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="363" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-294" parent="mmNIjh_8eKnvHOKM7R7M-293" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-295" parent="mmNIjh_8eKnvHOKM7R7M-293" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="execucao_transformacao_id" vertex="1">
          <mxGeometry height="40" width="218" x="103" as="geometry">
            <mxRectangle height="40" width="218" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-296" parent="mmNIjh_8eKnvHOKM7R7M-293" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="321" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-297" parent="mmNIjh_8eKnvHOKM7R7M-292" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="363" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-298" parent="mmNIjh_8eKnvHOKM7R7M-297" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-299" parent="mmNIjh_8eKnvHOKM7R7M-297" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="transformacao_id" vertex="1">
          <mxGeometry height="40" width="218" x="103" as="geometry">
            <mxRectangle height="40" width="218" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-300" parent="mmNIjh_8eKnvHOKM7R7M-297" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="321" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-301" parent="mmNIjh_8eKnvHOKM7R7M-292" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="363" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-302" parent="mmNIjh_8eKnvHOKM7R7M-301" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-303" parent="mmNIjh_8eKnvHOKM7R7M-301" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_dataset_entrada_id" vertex="1">
          <mxGeometry height="40" width="218" x="103" as="geometry">
            <mxRectangle height="40" width="218" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-304" parent="mmNIjh_8eKnvHOKM7R7M-301" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="321" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-305" parent="mmNIjh_8eKnvHOKM7R7M-292" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="363" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-306" parent="mmNIjh_8eKnvHOKM7R7M-305" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-307" parent="mmNIjh_8eKnvHOKM7R7M-305" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_dataset_saida_id" vertex="1">
          <mxGeometry height="40" width="218" x="103" as="geometry">
            <mxRectangle height="40" width="218" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-308" parent="mmNIjh_8eKnvHOKM7R7M-305" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="321" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-309" parent="mmNIjh_8eKnvHOKM7R7M-292" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="363" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-310" parent="mmNIjh_8eKnvHOKM7R7M-309" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-311" parent="mmNIjh_8eKnvHOKM7R7M-309" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="status" vertex="1">
          <mxGeometry height="40" width="218" x="103" as="geometry">
            <mxRectangle height="40" width="218" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-312" parent="mmNIjh_8eKnvHOKM7R7M-309" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="321" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-313" parent="mmNIjh_8eKnvHOKM7R7M-292" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="363" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-314" parent="mmNIjh_8eKnvHOKM7R7M-313" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-315" parent="mmNIjh_8eKnvHOKM7R7M-313" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="iniciada_em" vertex="1">
          <mxGeometry height="40" width="218" x="103" as="geometry">
            <mxRectangle height="40" width="218" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-316" parent="mmNIjh_8eKnvHOKM7R7M-313" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="321" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="FEATURE_SET" mermaidId="n:FEATURE_SET" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#ECFEFF;strokeColor=#22D3EE;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="FEATURE_SET" id="mmNIjh_8eKnvHOKM7R7M-317">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#ECFEFF;strokeColor=#22D3EE;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="272" x="3028" y="1142" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-318" parent="mmNIjh_8eKnvHOKM7R7M-317" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="272" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-319" parent="mmNIjh_8eKnvHOKM7R7M-318" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-320" parent="mmNIjh_8eKnvHOKM7R7M-318" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="feature_set_id" vertex="1">
          <mxGeometry height="40" width="127" x="103" as="geometry">
            <mxRectangle height="40" width="127" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-321" parent="mmNIjh_8eKnvHOKM7R7M-318" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="230" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-322" parent="mmNIjh_8eKnvHOKM7R7M-317" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="272" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-323" parent="mmNIjh_8eKnvHOKM7R7M-322" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-324" parent="mmNIjh_8eKnvHOKM7R7M-322" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="127" x="103" as="geometry">
            <mxRectangle height="40" width="127" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-325" parent="mmNIjh_8eKnvHOKM7R7M-322" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="230" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-326" parent="mmNIjh_8eKnvHOKM7R7M-317" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="272" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-327" parent="mmNIjh_8eKnvHOKM7R7M-326" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-328" parent="mmNIjh_8eKnvHOKM7R7M-326" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="127" x="103" as="geometry">
            <mxRectangle height="40" width="127" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-329" parent="mmNIjh_8eKnvHOKM7R7M-326" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="230" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-330" parent="mmNIjh_8eKnvHOKM7R7M-317" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="272" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-331" parent="mmNIjh_8eKnvHOKM7R7M-330" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-332" parent="mmNIjh_8eKnvHOKM7R7M-330" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="definicao" vertex="1">
          <mxGeometry height="40" width="127" x="103" as="geometry">
            <mxRectangle height="40" width="127" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-333" parent="mmNIjh_8eKnvHOKM7R7M-330" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="230" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-334" parent="mmNIjh_8eKnvHOKM7R7M-317" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="272" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-335" parent="mmNIjh_8eKnvHOKM7R7M-334" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-336" parent="mmNIjh_8eKnvHOKM7R7M-334" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_em" vertex="1">
          <mxGeometry height="40" width="127" x="103" as="geometry">
            <mxRectangle height="40" width="127" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-337" parent="mmNIjh_8eKnvHOKM7R7M-334" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="230" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="FEATURE" mermaidId="n:FEATURE" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDF4;strokeColor=#4ADE80;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="FEATURE" id="mmNIjh_8eKnvHOKM7R7M-338">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDF4;strokeColor=#4ADE80;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="255" x="3496" y="1746" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-339" parent="mmNIjh_8eKnvHOKM7R7M-338" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="255" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-340" parent="mmNIjh_8eKnvHOKM7R7M-339" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-341" parent="mmNIjh_8eKnvHOKM7R7M-339" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="feature_id" vertex="1">
          <mxGeometry height="40" width="127" x="86" as="geometry">
            <mxRectangle height="40" width="127" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-342" parent="mmNIjh_8eKnvHOKM7R7M-339" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="213" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-343" parent="mmNIjh_8eKnvHOKM7R7M-338" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="255" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-344" parent="mmNIjh_8eKnvHOKM7R7M-343" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-345" parent="mmNIjh_8eKnvHOKM7R7M-343" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="feature_set_id" vertex="1">
          <mxGeometry height="40" width="127" x="86" as="geometry">
            <mxRectangle height="40" width="127" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-346" parent="mmNIjh_8eKnvHOKM7R7M-343" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="213" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-347" parent="mmNIjh_8eKnvHOKM7R7M-338" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="255" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-348" parent="mmNIjh_8eKnvHOKM7R7M-347" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-349" parent="mmNIjh_8eKnvHOKM7R7M-347" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="127" x="86" as="geometry">
            <mxRectangle height="40" width="127" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-350" parent="mmNIjh_8eKnvHOKM7R7M-347" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="213" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-351" parent="mmNIjh_8eKnvHOKM7R7M-338" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="255" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-352" parent="mmNIjh_8eKnvHOKM7R7M-351" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-353" parent="mmNIjh_8eKnvHOKM7R7M-351" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="tipo_dado" vertex="1">
          <mxGeometry height="40" width="127" x="86" as="geometry">
            <mxRectangle height="40" width="127" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-354" parent="mmNIjh_8eKnvHOKM7R7M-351" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="213" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-355" parent="mmNIjh_8eKnvHOKM7R7M-338" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="255" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-356" parent="mmNIjh_8eKnvHOKM7R7M-355" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TEXT" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-357" parent="mmNIjh_8eKnvHOKM7R7M-355" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="descricao" vertex="1">
          <mxGeometry height="40" width="127" x="86" as="geometry">
            <mxRectangle height="40" width="127" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-358" parent="mmNIjh_8eKnvHOKM7R7M-355" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="213" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="LINHAGEM_DADOS" mermaidId="n:LINHAGEM_DADOS" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F5F3FF;strokeColor=#A78BFA;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="LINHAGEM_DADOS" id="mmNIjh_8eKnvHOKM7R7M-359">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F5F3FF;strokeColor=#A78BFA;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="360" x="2158" y="2285" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-360" parent="mmNIjh_8eKnvHOKM7R7M-359" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="360" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-361" parent="mmNIjh_8eKnvHOKM7R7M-360" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-362" parent="mmNIjh_8eKnvHOKM7R7M-360" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="linhagem_id" vertex="1">
          <mxGeometry height="40" width="215" x="103" as="geometry">
            <mxRectangle height="40" width="215" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-363" parent="mmNIjh_8eKnvHOKM7R7M-360" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="318" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-364" parent="mmNIjh_8eKnvHOKM7R7M-359" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="360" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-365" parent="mmNIjh_8eKnvHOKM7R7M-364" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-366" parent="mmNIjh_8eKnvHOKM7R7M-364" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_dataset_origem_id" vertex="1">
          <mxGeometry height="40" width="215" x="103" as="geometry">
            <mxRectangle height="40" width="215" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-367" parent="mmNIjh_8eKnvHOKM7R7M-364" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="318" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-368" parent="mmNIjh_8eKnvHOKM7R7M-359" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="360" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-369" parent="mmNIjh_8eKnvHOKM7R7M-368" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-370" parent="mmNIjh_8eKnvHOKM7R7M-368" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_dataset_destino_id" vertex="1">
          <mxGeometry height="40" width="215" x="103" as="geometry">
            <mxRectangle height="40" width="215" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-371" parent="mmNIjh_8eKnvHOKM7R7M-368" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="318" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-372" parent="mmNIjh_8eKnvHOKM7R7M-359" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="360" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-373" parent="mmNIjh_8eKnvHOKM7R7M-372" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-374" parent="mmNIjh_8eKnvHOKM7R7M-372" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="transformacao_id" vertex="1">
          <mxGeometry height="40" width="215" x="103" as="geometry">
            <mxRectangle height="40" width="215" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-375" parent="mmNIjh_8eKnvHOKM7R7M-372" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="318" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-376" parent="mmNIjh_8eKnvHOKM7R7M-359" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="360" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-377" parent="mmNIjh_8eKnvHOKM7R7M-376" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-378" parent="mmNIjh_8eKnvHOKM7R7M-376" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="registrado_em" vertex="1">
          <mxGeometry height="40" width="215" x="103" as="geometry">
            <mxRectangle height="40" width="215" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-379" parent="mmNIjh_8eKnvHOKM7R7M-376" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="318" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="EXPERIMENTO" mermaidId="n:EXPERIMENTO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEF2F2;strokeColor=#F87171;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="EXPERIMENTO" id="mmNIjh_8eKnvHOKM7R7M-380">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEF2F2;strokeColor=#F87171;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="279" x="2709" y="1109" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-381" parent="mmNIjh_8eKnvHOKM7R7M-380" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="279" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-382" parent="mmNIjh_8eKnvHOKM7R7M-381" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-383" parent="mmNIjh_8eKnvHOKM7R7M-381" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="experimento_id" vertex="1">
          <mxGeometry height="40" width="134" x="103" as="geometry">
            <mxRectangle height="40" width="134" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-384" parent="mmNIjh_8eKnvHOKM7R7M-381" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="237" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-385" parent="mmNIjh_8eKnvHOKM7R7M-380" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="279" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-386" parent="mmNIjh_8eKnvHOKM7R7M-385" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-387" parent="mmNIjh_8eKnvHOKM7R7M-385" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="134" x="103" as="geometry">
            <mxRectangle height="40" width="134" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-388" parent="mmNIjh_8eKnvHOKM7R7M-385" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="237" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-389" parent="mmNIjh_8eKnvHOKM7R7M-380" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="279" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-390" parent="mmNIjh_8eKnvHOKM7R7M-389" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-391" parent="mmNIjh_8eKnvHOKM7R7M-389" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_por" vertex="1">
          <mxGeometry height="40" width="134" x="103" as="geometry">
            <mxRectangle height="40" width="134" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-392" parent="mmNIjh_8eKnvHOKM7R7M-389" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="237" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-393" parent="mmNIjh_8eKnvHOKM7R7M-380" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="279" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-394" parent="mmNIjh_8eKnvHOKM7R7M-393" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-395" parent="mmNIjh_8eKnvHOKM7R7M-393" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="134" x="103" as="geometry">
            <mxRectangle height="40" width="134" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-396" parent="mmNIjh_8eKnvHOKM7R7M-393" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="237" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-397" parent="mmNIjh_8eKnvHOKM7R7M-380" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="279" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-398" parent="mmNIjh_8eKnvHOKM7R7M-397" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TEXT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-399" parent="mmNIjh_8eKnvHOKM7R7M-397" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="descricao" vertex="1">
          <mxGeometry height="40" width="134" x="103" as="geometry">
            <mxRectangle height="40" width="134" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-400" parent="mmNIjh_8eKnvHOKM7R7M-397" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="237" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-401" parent="mmNIjh_8eKnvHOKM7R7M-380" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="279" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-402" parent="mmNIjh_8eKnvHOKM7R7M-401" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-403" parent="mmNIjh_8eKnvHOKM7R7M-401" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_em" vertex="1">
          <mxGeometry height="40" width="134" x="103" as="geometry">
            <mxRectangle height="40" width="134" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-404" parent="mmNIjh_8eKnvHOKM7R7M-401" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="237" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="EXECUCAO_EXPERIMENTO" mermaidId="n:EXECUCAO_EXPERIMENTO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEFCE8;strokeColor=#FACC15;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="EXECUCAO_EXPERIMENTO" id="mmNIjh_8eKnvHOKM7R7M-405">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEFCE8;strokeColor=#FACC15;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="359" width="350" x="2748" y="2294" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-406" parent="mmNIjh_8eKnvHOKM7R7M-405" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-407" parent="mmNIjh_8eKnvHOKM7R7M-406" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-408" parent="mmNIjh_8eKnvHOKM7R7M-406" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="execucao_experimento_id" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-409" parent="mmNIjh_8eKnvHOKM7R7M-406" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-410" parent="mmNIjh_8eKnvHOKM7R7M-405" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-411" parent="mmNIjh_8eKnvHOKM7R7M-410" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-412" parent="mmNIjh_8eKnvHOKM7R7M-410" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="experimento_id" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-413" parent="mmNIjh_8eKnvHOKM7R7M-410" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-414" parent="mmNIjh_8eKnvHOKM7R7M-405" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-415" parent="mmNIjh_8eKnvHOKM7R7M-414" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-416" parent="mmNIjh_8eKnvHOKM7R7M-414" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_dataset_id" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-417" parent="mmNIjh_8eKnvHOKM7R7M-414" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-418" parent="mmNIjh_8eKnvHOKM7R7M-405" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-419" parent="mmNIjh_8eKnvHOKM7R7M-418" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-420" parent="mmNIjh_8eKnvHOKM7R7M-418" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="feature_set_id" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-421" parent="mmNIjh_8eKnvHOKM7R7M-418" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-422" parent="mmNIjh_8eKnvHOKM7R7M-405" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-423" parent="mmNIjh_8eKnvHOKM7R7M-422" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-424" parent="mmNIjh_8eKnvHOKM7R7M-422" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="hiperparametros" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-425" parent="mmNIjh_8eKnvHOKM7R7M-422" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-426" parent="mmNIjh_8eKnvHOKM7R7M-405" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-427" parent="mmNIjh_8eKnvHOKM7R7M-426" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-428" parent="mmNIjh_8eKnvHOKM7R7M-426" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="metricas" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-429" parent="mmNIjh_8eKnvHOKM7R7M-426" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-430" parent="mmNIjh_8eKnvHOKM7R7M-405" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="279" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-431" parent="mmNIjh_8eKnvHOKM7R7M-430" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-432" parent="mmNIjh_8eKnvHOKM7R7M-430" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="status" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-433" parent="mmNIjh_8eKnvHOKM7R7M-430" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-434" parent="mmNIjh_8eKnvHOKM7R7M-405" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="319" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-435" parent="mmNIjh_8eKnvHOKM7R7M-434" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-436" parent="mmNIjh_8eKnvHOKM7R7M-434" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="iniciada_em" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-437" parent="mmNIjh_8eKnvHOKM7R7M-434" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="ARTEFATO_MODELO" mermaidId="n:ARTEFATO_MODELO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#EEF2FF;strokeColor=#818CF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="ARTEFATO_MODELO" id="mmNIjh_8eKnvHOKM7R7M-438">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#EEF2FF;strokeColor=#818CF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="350" x="2748" y="3040" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-439" parent="mmNIjh_8eKnvHOKM7R7M-438" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-440" parent="mmNIjh_8eKnvHOKM7R7M-439" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-441" parent="mmNIjh_8eKnvHOKM7R7M-439" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="artefato_modelo_id" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-442" parent="mmNIjh_8eKnvHOKM7R7M-439" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-443" parent="mmNIjh_8eKnvHOKM7R7M-438" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-444" parent="mmNIjh_8eKnvHOKM7R7M-443" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-445" parent="mmNIjh_8eKnvHOKM7R7M-443" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="execucao_experimento_id" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-446" parent="mmNIjh_8eKnvHOKM7R7M-443" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-447" parent="mmNIjh_8eKnvHOKM7R7M-438" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-448" parent="mmNIjh_8eKnvHOKM7R7M-447" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-449" parent="mmNIjh_8eKnvHOKM7R7M-447" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="uri" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-450" parent="mmNIjh_8eKnvHOKM7R7M-447" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-451" parent="mmNIjh_8eKnvHOKM7R7M-438" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-452" parent="mmNIjh_8eKnvHOKM7R7M-451" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-453" parent="mmNIjh_8eKnvHOKM7R7M-451" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="formato" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-454" parent="mmNIjh_8eKnvHOKM7R7M-451" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-455" parent="mmNIjh_8eKnvHOKM7R7M-438" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-456" parent="mmNIjh_8eKnvHOKM7R7M-455" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="BIGINT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-457" parent="mmNIjh_8eKnvHOKM7R7M-455" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="tamanho_bytes" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-458" parent="mmNIjh_8eKnvHOKM7R7M-455" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-459" parent="mmNIjh_8eKnvHOKM7R7M-438" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="350" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-460" parent="mmNIjh_8eKnvHOKM7R7M-459" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-461" parent="mmNIjh_8eKnvHOKM7R7M-459" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_em" vertex="1">
          <mxGeometry height="40" width="205" x="103" as="geometry">
            <mxRectangle height="40" width="205" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-462" parent="mmNIjh_8eKnvHOKM7R7M-459" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="308" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="MODELO" mermaidId="n:MODELO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F7FEE7;strokeColor=#A3E635;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="MODELO" id="mmNIjh_8eKnvHOKM7R7M-463">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F7FEE7;strokeColor=#A3E635;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="279" x="3177" y="1759" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-464" parent="mmNIjh_8eKnvHOKM7R7M-463" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="279" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-465" parent="mmNIjh_8eKnvHOKM7R7M-464" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-466" parent="mmNIjh_8eKnvHOKM7R7M-464" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="modelo_id" vertex="1">
          <mxGeometry height="40" width="134" x="103" as="geometry">
            <mxRectangle height="40" width="134" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-467" parent="mmNIjh_8eKnvHOKM7R7M-464" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="237" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-468" parent="mmNIjh_8eKnvHOKM7R7M-463" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="279" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-469" parent="mmNIjh_8eKnvHOKM7R7M-468" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-470" parent="mmNIjh_8eKnvHOKM7R7M-468" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="134" x="103" as="geometry">
            <mxRectangle height="40" width="134" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-471" parent="mmNIjh_8eKnvHOKM7R7M-468" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="237" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-472" parent="mmNIjh_8eKnvHOKM7R7M-463" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="279" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-473" parent="mmNIjh_8eKnvHOKM7R7M-472" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-474" parent="mmNIjh_8eKnvHOKM7R7M-472" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="experimento_id" vertex="1">
          <mxGeometry height="40" width="134" x="103" as="geometry">
            <mxRectangle height="40" width="134" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-475" parent="mmNIjh_8eKnvHOKM7R7M-472" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="237" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-476" parent="mmNIjh_8eKnvHOKM7R7M-463" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="279" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-477" parent="mmNIjh_8eKnvHOKM7R7M-476" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-478" parent="mmNIjh_8eKnvHOKM7R7M-476" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="134" x="103" as="geometry">
            <mxRectangle height="40" width="134" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-479" parent="mmNIjh_8eKnvHOKM7R7M-476" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="237" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-480" parent="mmNIjh_8eKnvHOKM7R7M-463" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="279" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-481" parent="mmNIjh_8eKnvHOKM7R7M-480" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-482" parent="mmNIjh_8eKnvHOKM7R7M-480" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="tarefa" vertex="1">
          <mxGeometry height="40" width="134" x="103" as="geometry">
            <mxRectangle height="40" width="134" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-483" parent="mmNIjh_8eKnvHOKM7R7M-480" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="237" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-484" parent="mmNIjh_8eKnvHOKM7R7M-463" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="279" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-485" parent="mmNIjh_8eKnvHOKM7R7M-484" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-486" parent="mmNIjh_8eKnvHOKM7R7M-484" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_em" vertex="1">
          <mxGeometry height="40" width="134" x="103" as="geometry">
            <mxRectangle height="40" width="134" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-487" parent="mmNIjh_8eKnvHOKM7R7M-484" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="237" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="VERSAO_MODELO" mermaidId="n:VERSAO_MODELO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0F9FF;strokeColor=#38BDF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="VERSAO_MODELO" id="mmNIjh_8eKnvHOKM7R7M-488">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0F9FF;strokeColor=#38BDF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="319" width="307" x="2909" y="3440" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-489" parent="mmNIjh_8eKnvHOKM7R7M-488" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="307" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-490" parent="mmNIjh_8eKnvHOKM7R7M-489" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-491" parent="mmNIjh_8eKnvHOKM7R7M-489" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_modelo_id" vertex="1">
          <mxGeometry height="40" width="162" x="103" as="geometry">
            <mxRectangle height="40" width="162" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-492" parent="mmNIjh_8eKnvHOKM7R7M-489" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="265" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-493" parent="mmNIjh_8eKnvHOKM7R7M-488" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="307" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-494" parent="mmNIjh_8eKnvHOKM7R7M-493" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-495" parent="mmNIjh_8eKnvHOKM7R7M-493" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="modelo_id" vertex="1">
          <mxGeometry height="40" width="162" x="103" as="geometry">
            <mxRectangle height="40" width="162" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-496" parent="mmNIjh_8eKnvHOKM7R7M-493" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="265" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-497" parent="mmNIjh_8eKnvHOKM7R7M-488" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="307" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-498" parent="mmNIjh_8eKnvHOKM7R7M-497" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-499" parent="mmNIjh_8eKnvHOKM7R7M-497" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="artefato_modelo_id" vertex="1">
          <mxGeometry height="40" width="162" x="103" as="geometry">
            <mxRectangle height="40" width="162" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-500" parent="mmNIjh_8eKnvHOKM7R7M-497" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="265" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-501" parent="mmNIjh_8eKnvHOKM7R7M-488" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="307" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-502" parent="mmNIjh_8eKnvHOKM7R7M-501" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-503" parent="mmNIjh_8eKnvHOKM7R7M-501" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="numero_versao" vertex="1">
          <mxGeometry height="40" width="162" x="103" as="geometry">
            <mxRectangle height="40" width="162" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-504" parent="mmNIjh_8eKnvHOKM7R7M-501" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="265" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-505" parent="mmNIjh_8eKnvHOKM7R7M-488" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="307" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-506" parent="mmNIjh_8eKnvHOKM7R7M-505" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-507" parent="mmNIjh_8eKnvHOKM7R7M-505" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="estagio" vertex="1">
          <mxGeometry height="40" width="162" x="103" as="geometry">
            <mxRectangle height="40" width="162" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-508" parent="mmNIjh_8eKnvHOKM7R7M-505" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="265" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-509" parent="mmNIjh_8eKnvHOKM7R7M-488" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="307" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-510" parent="mmNIjh_8eKnvHOKM7R7M-509" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-511" parent="mmNIjh_8eKnvHOKM7R7M-509" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="metricas" vertex="1">
          <mxGeometry height="40" width="162" x="103" as="geometry">
            <mxRectangle height="40" width="162" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-512" parent="mmNIjh_8eKnvHOKM7R7M-509" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="265" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-513" parent="mmNIjh_8eKnvHOKM7R7M-488" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="307" y="279" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-514" parent="mmNIjh_8eKnvHOKM7R7M-513" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-515" parent="mmNIjh_8eKnvHOKM7R7M-513" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="registrado_em" vertex="1">
          <mxGeometry height="40" width="162" x="103" as="geometry">
            <mxRectangle height="40" width="162" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-516" parent="mmNIjh_8eKnvHOKM7R7M-513" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="265" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="AVALIACAO_MODELO" mermaidId="n:AVALIACAO_MODELO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF1F2;strokeColor=#FB7185;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="AVALIACAO_MODELO" id="mmNIjh_8eKnvHOKM7R7M-517">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF1F2;strokeColor=#FB7185;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="300" x="380" y="3879" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-518" parent="mmNIjh_8eKnvHOKM7R7M-517" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-519" parent="mmNIjh_8eKnvHOKM7R7M-518" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-520" parent="mmNIjh_8eKnvHOKM7R7M-518" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="avaliacao_id" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-521" parent="mmNIjh_8eKnvHOKM7R7M-518" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-522" parent="mmNIjh_8eKnvHOKM7R7M-517" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-523" parent="mmNIjh_8eKnvHOKM7R7M-522" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-524" parent="mmNIjh_8eKnvHOKM7R7M-522" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_modelo_id" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-525" parent="mmNIjh_8eKnvHOKM7R7M-522" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-526" parent="mmNIjh_8eKnvHOKM7R7M-517" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-527" parent="mmNIjh_8eKnvHOKM7R7M-526" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-528" parent="mmNIjh_8eKnvHOKM7R7M-526" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_dataset_id" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-529" parent="mmNIjh_8eKnvHOKM7R7M-526" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-530" parent="mmNIjh_8eKnvHOKM7R7M-517" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-531" parent="mmNIjh_8eKnvHOKM7R7M-530" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-532" parent="mmNIjh_8eKnvHOKM7R7M-530" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="metricas" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-533" parent="mmNIjh_8eKnvHOKM7R7M-530" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-534" parent="mmNIjh_8eKnvHOKM7R7M-517" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-535" parent="mmNIjh_8eKnvHOKM7R7M-534" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-536" parent="mmNIjh_8eKnvHOKM7R7M-534" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="resultado" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-537" parent="mmNIjh_8eKnvHOKM7R7M-534" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-538" parent="mmNIjh_8eKnvHOKM7R7M-517" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="300" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-539" parent="mmNIjh_8eKnvHOKM7R7M-538" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-540" parent="mmNIjh_8eKnvHOKM7R7M-538" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="avaliado_em" vertex="1">
          <mxGeometry height="40" width="155" x="103" as="geometry">
            <mxRectangle height="40" width="155" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-541" parent="mmNIjh_8eKnvHOKM7R7M-538" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="258" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="MODELO_LLM" mermaidId="n:MODELO_LLM" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FDF4FF;strokeColor=#E879F9;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="MODELO_LLM" id="mmNIjh_8eKnvHOKM7R7M-542">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FDF4FF;strokeColor=#E879F9;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="264" x="5104" y="1109" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-543" parent="mmNIjh_8eKnvHOKM7R7M-542" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="264" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-544" parent="mmNIjh_8eKnvHOKM7R7M-543" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-545" parent="mmNIjh_8eKnvHOKM7R7M-543" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="modelo_llm_id" vertex="1">
          <mxGeometry height="40" width="136" x="86" as="geometry">
            <mxRectangle height="40" width="136" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-546" parent="mmNIjh_8eKnvHOKM7R7M-543" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="222" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-547" parent="mmNIjh_8eKnvHOKM7R7M-542" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="264" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-548" parent="mmNIjh_8eKnvHOKM7R7M-547" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-549" parent="mmNIjh_8eKnvHOKM7R7M-547" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="136" x="86" as="geometry">
            <mxRectangle height="40" width="136" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-550" parent="mmNIjh_8eKnvHOKM7R7M-547" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="222" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-551" parent="mmNIjh_8eKnvHOKM7R7M-542" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="264" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-552" parent="mmNIjh_8eKnvHOKM7R7M-551" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-553" parent="mmNIjh_8eKnvHOKM7R7M-551" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="provedor" vertex="1">
          <mxGeometry height="40" width="136" x="86" as="geometry">
            <mxRectangle height="40" width="136" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-554" parent="mmNIjh_8eKnvHOKM7R7M-551" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="222" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-555" parent="mmNIjh_8eKnvHOKM7R7M-542" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="264" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-556" parent="mmNIjh_8eKnvHOKM7R7M-555" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-557" parent="mmNIjh_8eKnvHOKM7R7M-555" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="136" x="86" as="geometry">
            <mxRectangle height="40" width="136" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-558" parent="mmNIjh_8eKnvHOKM7R7M-555" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="222" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-559" parent="mmNIjh_8eKnvHOKM7R7M-542" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="264" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-560" parent="mmNIjh_8eKnvHOKM7R7M-559" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-561" parent="mmNIjh_8eKnvHOKM7R7M-559" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao" vertex="1">
          <mxGeometry height="40" width="136" x="86" as="geometry">
            <mxRectangle height="40" width="136" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-562" parent="mmNIjh_8eKnvHOKM7R7M-559" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="222" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-563" parent="mmNIjh_8eKnvHOKM7R7M-542" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="264" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-564" parent="mmNIjh_8eKnvHOKM7R7M-563" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="INT" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-565" parent="mmNIjh_8eKnvHOKM7R7M-563" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="limite_contexto" vertex="1">
          <mxGeometry height="40" width="136" x="86" as="geometry">
            <mxRectangle height="40" width="136" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-566" parent="mmNIjh_8eKnvHOKM7R7M-563" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="222" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="PROMPT" mermaidId="n:PROMPT" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="PROMPT" id="mmNIjh_8eKnvHOKM7R7M-567">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="244" x="5408" y="1102" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-568" parent="mmNIjh_8eKnvHOKM7R7M-567" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-569" parent="mmNIjh_8eKnvHOKM7R7M-568" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-570" parent="mmNIjh_8eKnvHOKM7R7M-568" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="prompt_id" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-571" parent="mmNIjh_8eKnvHOKM7R7M-568" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-572" parent="mmNIjh_8eKnvHOKM7R7M-567" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-573" parent="mmNIjh_8eKnvHOKM7R7M-572" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-574" parent="mmNIjh_8eKnvHOKM7R7M-572" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-575" parent="mmNIjh_8eKnvHOKM7R7M-572" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-576" parent="mmNIjh_8eKnvHOKM7R7M-567" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-577" parent="mmNIjh_8eKnvHOKM7R7M-576" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-578" parent="mmNIjh_8eKnvHOKM7R7M-576" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_por" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-579" parent="mmNIjh_8eKnvHOKM7R7M-576" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-580" parent="mmNIjh_8eKnvHOKM7R7M-567" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-581" parent="mmNIjh_8eKnvHOKM7R7M-580" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-582" parent="mmNIjh_8eKnvHOKM7R7M-580" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-583" parent="mmNIjh_8eKnvHOKM7R7M-580" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-584" parent="mmNIjh_8eKnvHOKM7R7M-567" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-585" parent="mmNIjh_8eKnvHOKM7R7M-584" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TEXT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-586" parent="mmNIjh_8eKnvHOKM7R7M-584" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="descricao" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-587" parent="mmNIjh_8eKnvHOKM7R7M-584" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-588" parent="mmNIjh_8eKnvHOKM7R7M-567" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-589" parent="mmNIjh_8eKnvHOKM7R7M-588" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-590" parent="mmNIjh_8eKnvHOKM7R7M-588" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_em" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-591" parent="mmNIjh_8eKnvHOKM7R7M-588" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="VERSAO_PROMPT" mermaidId="n:VERSAO_PROMPT" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF7ED;strokeColor=#FB923C;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="VERSAO_PROMPT" id="mmNIjh_8eKnvHOKM7R7M-592">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF7ED;strokeColor=#FB923C;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="295" x="5383" y="1765" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-593" parent="mmNIjh_8eKnvHOKM7R7M-592" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="295" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-594" parent="mmNIjh_8eKnvHOKM7R7M-593" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-595" parent="mmNIjh_8eKnvHOKM7R7M-593" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_prompt_id" vertex="1">
          <mxGeometry height="40" width="150" x="103" as="geometry">
            <mxRectangle height="40" width="150" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-596" parent="mmNIjh_8eKnvHOKM7R7M-593" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="253" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-597" parent="mmNIjh_8eKnvHOKM7R7M-592" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="295" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-598" parent="mmNIjh_8eKnvHOKM7R7M-597" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-599" parent="mmNIjh_8eKnvHOKM7R7M-597" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="prompt_id" vertex="1">
          <mxGeometry height="40" width="150" x="103" as="geometry">
            <mxRectangle height="40" width="150" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-600" parent="mmNIjh_8eKnvHOKM7R7M-597" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="253" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-601" parent="mmNIjh_8eKnvHOKM7R7M-592" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="295" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-602" parent="mmNIjh_8eKnvHOKM7R7M-601" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="INT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-603" parent="mmNIjh_8eKnvHOKM7R7M-601" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="numero_versao" vertex="1">
          <mxGeometry height="40" width="150" x="103" as="geometry">
            <mxRectangle height="40" width="150" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-604" parent="mmNIjh_8eKnvHOKM7R7M-601" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="253" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-605" parent="mmNIjh_8eKnvHOKM7R7M-592" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="295" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-606" parent="mmNIjh_8eKnvHOKM7R7M-605" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TEXT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-607" parent="mmNIjh_8eKnvHOKM7R7M-605" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="template" vertex="1">
          <mxGeometry height="40" width="150" x="103" as="geometry">
            <mxRectangle height="40" width="150" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-608" parent="mmNIjh_8eKnvHOKM7R7M-605" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="253" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-609" parent="mmNIjh_8eKnvHOKM7R7M-592" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="295" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-610" parent="mmNIjh_8eKnvHOKM7R7M-609" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-611" parent="mmNIjh_8eKnvHOKM7R7M-609" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="variaveis" vertex="1">
          <mxGeometry height="40" width="150" x="103" as="geometry">
            <mxRectangle height="40" width="150" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-612" parent="mmNIjh_8eKnvHOKM7R7M-609" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="253" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-613" parent="mmNIjh_8eKnvHOKM7R7M-592" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="295" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-614" parent="mmNIjh_8eKnvHOKM7R7M-613" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-615" parent="mmNIjh_8eKnvHOKM7R7M-613" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criada_em" vertex="1">
          <mxGeometry height="40" width="150" x="103" as="geometry">
            <mxRectangle height="40" width="150" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-616" parent="mmNIjh_8eKnvHOKM7R7M-613" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="253" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="EXECUCAO_PROMPT" mermaidId="n:EXECUCAO_PROMPT" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#ECFEFF;strokeColor=#22D3EE;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="EXECUCAO_PROMPT" id="mmNIjh_8eKnvHOKM7R7M-617">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#ECFEFF;strokeColor=#22D3EE;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="399" width="312" x="5331" y="2285" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-618" parent="mmNIjh_8eKnvHOKM7R7M-617" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-619" parent="mmNIjh_8eKnvHOKM7R7M-618" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-620" parent="mmNIjh_8eKnvHOKM7R7M-618" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="execucao_prompt_id" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-621" parent="mmNIjh_8eKnvHOKM7R7M-618" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-622" parent="mmNIjh_8eKnvHOKM7R7M-617" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-623" parent="mmNIjh_8eKnvHOKM7R7M-622" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-624" parent="mmNIjh_8eKnvHOKM7R7M-622" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_prompt_id" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-625" parent="mmNIjh_8eKnvHOKM7R7M-622" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-626" parent="mmNIjh_8eKnvHOKM7R7M-617" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-627" parent="mmNIjh_8eKnvHOKM7R7M-626" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-628" parent="mmNIjh_8eKnvHOKM7R7M-626" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="modelo_llm_id" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-629" parent="mmNIjh_8eKnvHOKM7R7M-626" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-630" parent="mmNIjh_8eKnvHOKM7R7M-617" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-631" parent="mmNIjh_8eKnvHOKM7R7M-630" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-632" parent="mmNIjh_8eKnvHOKM7R7M-630" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="usuario_id" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-633" parent="mmNIjh_8eKnvHOKM7R7M-630" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-634" parent="mmNIjh_8eKnvHOKM7R7M-617" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-635" parent="mmNIjh_8eKnvHOKM7R7M-634" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-636" parent="mmNIjh_8eKnvHOKM7R7M-634" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="entrada" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-637" parent="mmNIjh_8eKnvHOKM7R7M-634" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-638" parent="mmNIjh_8eKnvHOKM7R7M-617" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-639" parent="mmNIjh_8eKnvHOKM7R7M-638" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TEXT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-640" parent="mmNIjh_8eKnvHOKM7R7M-638" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="saida" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-641" parent="mmNIjh_8eKnvHOKM7R7M-638" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-642" parent="mmNIjh_8eKnvHOKM7R7M-617" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="279" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-643" parent="mmNIjh_8eKnvHOKM7R7M-642" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="INT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-644" parent="mmNIjh_8eKnvHOKM7R7M-642" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="tokens_entrada" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-645" parent="mmNIjh_8eKnvHOKM7R7M-642" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-646" parent="mmNIjh_8eKnvHOKM7R7M-617" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="319" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-647" parent="mmNIjh_8eKnvHOKM7R7M-646" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="INT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-648" parent="mmNIjh_8eKnvHOKM7R7M-646" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="tokens_saida" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-649" parent="mmNIjh_8eKnvHOKM7R7M-646" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-650" parent="mmNIjh_8eKnvHOKM7R7M-617" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="359" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-651" parent="mmNIjh_8eKnvHOKM7R7M-650" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-652" parent="mmNIjh_8eKnvHOKM7R7M-650" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="executada_em" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-653" parent="mmNIjh_8eKnvHOKM7R7M-650" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="BASE_CONHECIMENTO" mermaidId="n:BASE_CONHECIMENTO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDF4;strokeColor=#4ADE80;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="BASE_CONHECIMENTO" id="mmNIjh_8eKnvHOKM7R7M-654">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDF4;strokeColor=#4ADE80;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="327" x="563" y="1467" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-655" parent="mmNIjh_8eKnvHOKM7R7M-654" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="327" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-656" parent="mmNIjh_8eKnvHOKM7R7M-655" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-657" parent="mmNIjh_8eKnvHOKM7R7M-655" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="base_conhecimento_id" vertex="1">
          <mxGeometry height="40" width="182" x="103" as="geometry">
            <mxRectangle height="40" width="182" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-658" parent="mmNIjh_8eKnvHOKM7R7M-655" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="285" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-659" parent="mmNIjh_8eKnvHOKM7R7M-654" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="327" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-660" parent="mmNIjh_8eKnvHOKM7R7M-659" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-661" parent="mmNIjh_8eKnvHOKM7R7M-659" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="182" x="103" as="geometry">
            <mxRectangle height="40" width="182" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-662" parent="mmNIjh_8eKnvHOKM7R7M-659" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="285" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-663" parent="mmNIjh_8eKnvHOKM7R7M-654" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="327" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-664" parent="mmNIjh_8eKnvHOKM7R7M-663" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-665" parent="mmNIjh_8eKnvHOKM7R7M-663" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="182" x="103" as="geometry">
            <mxRectangle height="40" width="182" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-666" parent="mmNIjh_8eKnvHOKM7R7M-663" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="285" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-667" parent="mmNIjh_8eKnvHOKM7R7M-654" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="327" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-668" parent="mmNIjh_8eKnvHOKM7R7M-667" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-669" parent="mmNIjh_8eKnvHOKM7R7M-667" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="estrategia_divisao" vertex="1">
          <mxGeometry height="40" width="182" x="103" as="geometry">
            <mxRectangle height="40" width="182" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-670" parent="mmNIjh_8eKnvHOKM7R7M-667" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="285" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-671" parent="mmNIjh_8eKnvHOKM7R7M-654" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="327" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-672" parent="mmNIjh_8eKnvHOKM7R7M-671" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-673" parent="mmNIjh_8eKnvHOKM7R7M-671" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criada_em" vertex="1">
          <mxGeometry height="40" width="182" x="103" as="geometry">
            <mxRectangle height="40" width="182" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-674" parent="mmNIjh_8eKnvHOKM7R7M-671" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="285" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="DOCUMENTO_CONHECIMENTO" mermaidId="n:DOCUMENTO_CONHECIMENTO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F5F3FF;strokeColor=#A78BFA;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="DOCUMENTO_CONHECIMENTO" id="mmNIjh_8eKnvHOKM7R7M-675">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F5F3FF;strokeColor=#A78BFA;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="327" x="734" y="2324" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-676" parent="mmNIjh_8eKnvHOKM7R7M-675" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="327" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-677" parent="mmNIjh_8eKnvHOKM7R7M-676" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-678" parent="mmNIjh_8eKnvHOKM7R7M-676" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="documento_id" vertex="1">
          <mxGeometry height="40" width="182" x="103" as="geometry">
            <mxRectangle height="40" width="182" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-679" parent="mmNIjh_8eKnvHOKM7R7M-676" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="285" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-680" parent="mmNIjh_8eKnvHOKM7R7M-675" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="327" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-681" parent="mmNIjh_8eKnvHOKM7R7M-680" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-682" parent="mmNIjh_8eKnvHOKM7R7M-680" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="base_conhecimento_id" vertex="1">
          <mxGeometry height="40" width="182" x="103" as="geometry">
            <mxRectangle height="40" width="182" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-683" parent="mmNIjh_8eKnvHOKM7R7M-680" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="285" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-684" parent="mmNIjh_8eKnvHOKM7R7M-675" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="327" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-685" parent="mmNIjh_8eKnvHOKM7R7M-684" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-686" parent="mmNIjh_8eKnvHOKM7R7M-684" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_dataset_id" vertex="1">
          <mxGeometry height="40" width="182" x="103" as="geometry">
            <mxRectangle height="40" width="182" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-687" parent="mmNIjh_8eKnvHOKM7R7M-684" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="285" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-688" parent="mmNIjh_8eKnvHOKM7R7M-675" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="327" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-689" parent="mmNIjh_8eKnvHOKM7R7M-688" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-690" parent="mmNIjh_8eKnvHOKM7R7M-688" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="uri" vertex="1">
          <mxGeometry height="40" width="182" x="103" as="geometry">
            <mxRectangle height="40" width="182" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-691" parent="mmNIjh_8eKnvHOKM7R7M-688" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="285" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-692" parent="mmNIjh_8eKnvHOKM7R7M-675" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="327" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-693" parent="mmNIjh_8eKnvHOKM7R7M-692" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-694" parent="mmNIjh_8eKnvHOKM7R7M-692" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="metadados" vertex="1">
          <mxGeometry height="40" width="182" x="103" as="geometry">
            <mxRectangle height="40" width="182" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-695" parent="mmNIjh_8eKnvHOKM7R7M-692" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="285" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-696" parent="mmNIjh_8eKnvHOKM7R7M-675" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="327" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-697" parent="mmNIjh_8eKnvHOKM7R7M-696" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-698" parent="mmNIjh_8eKnvHOKM7R7M-696" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="indexado_em" vertex="1">
          <mxGeometry height="40" width="182" x="103" as="geometry">
            <mxRectangle height="40" width="182" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-699" parent="mmNIjh_8eKnvHOKM7R7M-696" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="285" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="EMBEDDING" mermaidId="n:EMBEDDING" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEF2F2;strokeColor=#F87171;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="EMBEDDING" id="mmNIjh_8eKnvHOKM7R7M-700">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEF2F2;strokeColor=#F87171;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="304" x="745" y="3021" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-701" parent="mmNIjh_8eKnvHOKM7R7M-700" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="304" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-702" parent="mmNIjh_8eKnvHOKM7R7M-701" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-703" parent="mmNIjh_8eKnvHOKM7R7M-701" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="embedding_id" vertex="1">
          <mxGeometry height="40" width="159" x="103" as="geometry">
            <mxRectangle height="40" width="159" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-704" parent="mmNIjh_8eKnvHOKM7R7M-701" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="262" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-705" parent="mmNIjh_8eKnvHOKM7R7M-700" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="304" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-706" parent="mmNIjh_8eKnvHOKM7R7M-705" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-707" parent="mmNIjh_8eKnvHOKM7R7M-705" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="documento_id" vertex="1">
          <mxGeometry height="40" width="159" x="103" as="geometry">
            <mxRectangle height="40" width="159" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-708" parent="mmNIjh_8eKnvHOKM7R7M-705" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="262" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-709" parent="mmNIjh_8eKnvHOKM7R7M-700" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="304" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-710" parent="mmNIjh_8eKnvHOKM7R7M-709" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-711" parent="mmNIjh_8eKnvHOKM7R7M-709" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="modelo_embedding" vertex="1">
          <mxGeometry height="40" width="159" x="103" as="geometry">
            <mxRectangle height="40" width="159" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-712" parent="mmNIjh_8eKnvHOKM7R7M-709" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="262" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-713" parent="mmNIjh_8eKnvHOKM7R7M-700" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="304" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-714" parent="mmNIjh_8eKnvHOKM7R7M-713" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VECTOR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-715" parent="mmNIjh_8eKnvHOKM7R7M-713" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="vetor" vertex="1">
          <mxGeometry height="40" width="159" x="103" as="geometry">
            <mxRectangle height="40" width="159" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-716" parent="mmNIjh_8eKnvHOKM7R7M-713" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="262" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-717" parent="mmNIjh_8eKnvHOKM7R7M-700" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="304" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-718" parent="mmNIjh_8eKnvHOKM7R7M-717" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-719" parent="mmNIjh_8eKnvHOKM7R7M-717" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_em" vertex="1">
          <mxGeometry height="40" width="159" x="103" as="geometry">
            <mxRectangle height="40" width="159" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-720" parent="mmNIjh_8eKnvHOKM7R7M-717" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="262" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="CONVERSA" mermaidId="n:CONVERSA" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEFCE8;strokeColor=#FACC15;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="CONVERSA" id="mmNIjh_8eKnvHOKM7R7M-721">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEFCE8;strokeColor=#FACC15;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="268" x="6153" y="1116" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-722" parent="mmNIjh_8eKnvHOKM7R7M-721" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="268" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-723" parent="mmNIjh_8eKnvHOKM7R7M-722" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-724" parent="mmNIjh_8eKnvHOKM7R7M-722" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="conversa_id" vertex="1">
          <mxGeometry height="40" width="123" x="103" as="geometry">
            <mxRectangle height="40" width="123" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-725" parent="mmNIjh_8eKnvHOKM7R7M-722" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="226" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-726" parent="mmNIjh_8eKnvHOKM7R7M-721" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="268" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-727" parent="mmNIjh_8eKnvHOKM7R7M-726" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-728" parent="mmNIjh_8eKnvHOKM7R7M-726" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="usuario_id" vertex="1">
          <mxGeometry height="40" width="123" x="103" as="geometry">
            <mxRectangle height="40" width="123" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-729" parent="mmNIjh_8eKnvHOKM7R7M-726" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="226" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-730" parent="mmNIjh_8eKnvHOKM7R7M-721" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="268" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-731" parent="mmNIjh_8eKnvHOKM7R7M-730" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-732" parent="mmNIjh_8eKnvHOKM7R7M-730" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="123" x="103" as="geometry">
            <mxRectangle height="40" width="123" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-733" parent="mmNIjh_8eKnvHOKM7R7M-730" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="226" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-734" parent="mmNIjh_8eKnvHOKM7R7M-721" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="268" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-735" parent="mmNIjh_8eKnvHOKM7R7M-734" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-736" parent="mmNIjh_8eKnvHOKM7R7M-734" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="iniciada_em" vertex="1">
          <mxGeometry height="40" width="123" x="103" as="geometry">
            <mxRectangle height="40" width="123" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-737" parent="mmNIjh_8eKnvHOKM7R7M-734" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="226" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-738" parent="mmNIjh_8eKnvHOKM7R7M-721" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="268" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-739" parent="mmNIjh_8eKnvHOKM7R7M-738" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-740" parent="mmNIjh_8eKnvHOKM7R7M-738" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="encerrada_em" vertex="1">
          <mxGeometry height="40" width="123" x="103" as="geometry">
            <mxRectangle height="40" width="123" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-741" parent="mmNIjh_8eKnvHOKM7R7M-738" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="226" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="MENSAGEM" mermaidId="n:MENSAGEM" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#EEF2FF;strokeColor=#818CF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="MENSAGEM" id="mmNIjh_8eKnvHOKM7R7M-742">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#EEF2FF;strokeColor=#818CF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="312" x="5811" y="3021" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-743" parent="mmNIjh_8eKnvHOKM7R7M-742" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-744" parent="mmNIjh_8eKnvHOKM7R7M-743" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-745" parent="mmNIjh_8eKnvHOKM7R7M-743" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="mensagem_id" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-746" parent="mmNIjh_8eKnvHOKM7R7M-743" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-747" parent="mmNIjh_8eKnvHOKM7R7M-742" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-748" parent="mmNIjh_8eKnvHOKM7R7M-747" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-749" parent="mmNIjh_8eKnvHOKM7R7M-747" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="conversa_id" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-750" parent="mmNIjh_8eKnvHOKM7R7M-747" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-751" parent="mmNIjh_8eKnvHOKM7R7M-742" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-752" parent="mmNIjh_8eKnvHOKM7R7M-751" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-753" parent="mmNIjh_8eKnvHOKM7R7M-751" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="execucao_prompt_id" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-754" parent="mmNIjh_8eKnvHOKM7R7M-751" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-755" parent="mmNIjh_8eKnvHOKM7R7M-742" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-756" parent="mmNIjh_8eKnvHOKM7R7M-755" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-757" parent="mmNIjh_8eKnvHOKM7R7M-755" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="papel" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-758" parent="mmNIjh_8eKnvHOKM7R7M-755" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-759" parent="mmNIjh_8eKnvHOKM7R7M-742" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-760" parent="mmNIjh_8eKnvHOKM7R7M-759" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TEXT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-761" parent="mmNIjh_8eKnvHOKM7R7M-759" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="conteudo" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-762" parent="mmNIjh_8eKnvHOKM7R7M-759" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-763" parent="mmNIjh_8eKnvHOKM7R7M-742" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-764" parent="mmNIjh_8eKnvHOKM7R7M-763" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-765" parent="mmNIjh_8eKnvHOKM7R7M-763" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criada_em" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-766" parent="mmNIjh_8eKnvHOKM7R7M-763" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="PIPELINE" mermaidId="n:PIPELINE" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F7FEE7;strokeColor=#A3E635;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="PIPELINE" id="mmNIjh_8eKnvHOKM7R7M-767">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F7FEE7;strokeColor=#A3E635;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="247" x="4472" y="1109" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-768" parent="mmNIjh_8eKnvHOKM7R7M-767" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="247" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-769" parent="mmNIjh_8eKnvHOKM7R7M-768" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-770" parent="mmNIjh_8eKnvHOKM7R7M-768" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="pipeline_id" vertex="1">
          <mxGeometry height="40" width="102" x="103" as="geometry">
            <mxRectangle height="40" width="102" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-771" parent="mmNIjh_8eKnvHOKM7R7M-768" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="205" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-772" parent="mmNIjh_8eKnvHOKM7R7M-767" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="247" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-773" parent="mmNIjh_8eKnvHOKM7R7M-772" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-774" parent="mmNIjh_8eKnvHOKM7R7M-772" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="102" x="103" as="geometry">
            <mxRectangle height="40" width="102" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-775" parent="mmNIjh_8eKnvHOKM7R7M-772" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="205" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-776" parent="mmNIjh_8eKnvHOKM7R7M-767" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="247" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-777" parent="mmNIjh_8eKnvHOKM7R7M-776" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-778" parent="mmNIjh_8eKnvHOKM7R7M-776" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_por" vertex="1">
          <mxGeometry height="40" width="102" x="103" as="geometry">
            <mxRectangle height="40" width="102" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-779" parent="mmNIjh_8eKnvHOKM7R7M-776" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="205" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-780" parent="mmNIjh_8eKnvHOKM7R7M-767" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="247" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-781" parent="mmNIjh_8eKnvHOKM7R7M-780" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-782" parent="mmNIjh_8eKnvHOKM7R7M-780" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="102" x="103" as="geometry">
            <mxRectangle height="40" width="102" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-783" parent="mmNIjh_8eKnvHOKM7R7M-780" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="205" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-784" parent="mmNIjh_8eKnvHOKM7R7M-767" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="247" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-785" parent="mmNIjh_8eKnvHOKM7R7M-784" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-786" parent="mmNIjh_8eKnvHOKM7R7M-784" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="definicao" vertex="1">
          <mxGeometry height="40" width="102" x="103" as="geometry">
            <mxRectangle height="40" width="102" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-787" parent="mmNIjh_8eKnvHOKM7R7M-784" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="205" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-788" parent="mmNIjh_8eKnvHOKM7R7M-767" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="247" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-789" parent="mmNIjh_8eKnvHOKM7R7M-788" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-790" parent="mmNIjh_8eKnvHOKM7R7M-788" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criado_em" vertex="1">
          <mxGeometry height="40" width="102" x="103" as="geometry">
            <mxRectangle height="40" width="102" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-791" parent="mmNIjh_8eKnvHOKM7R7M-788" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="205" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="ETAPA_PIPELINE" mermaidId="n:ETAPA_PIPELINE" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0F9FF;strokeColor=#38BDF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="ETAPA_PIPELINE" id="mmNIjh_8eKnvHOKM7R7M-792">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0F9FF;strokeColor=#38BDF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="278" x="4288" y="1765" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-793" parent="mmNIjh_8eKnvHOKM7R7M-792" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="278" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-794" parent="mmNIjh_8eKnvHOKM7R7M-793" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-795" parent="mmNIjh_8eKnvHOKM7R7M-793" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="etapa_pipeline_id" vertex="1">
          <mxGeometry height="40" width="150" x="86" as="geometry">
            <mxRectangle height="40" width="150" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-796" parent="mmNIjh_8eKnvHOKM7R7M-793" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="236" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-797" parent="mmNIjh_8eKnvHOKM7R7M-792" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="278" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-798" parent="mmNIjh_8eKnvHOKM7R7M-797" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-799" parent="mmNIjh_8eKnvHOKM7R7M-797" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="pipeline_id" vertex="1">
          <mxGeometry height="40" width="150" x="86" as="geometry">
            <mxRectangle height="40" width="150" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-800" parent="mmNIjh_8eKnvHOKM7R7M-797" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="236" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-801" parent="mmNIjh_8eKnvHOKM7R7M-792" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="278" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-802" parent="mmNIjh_8eKnvHOKM7R7M-801" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-803" parent="mmNIjh_8eKnvHOKM7R7M-801" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="150" x="86" as="geometry">
            <mxRectangle height="40" width="150" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-804" parent="mmNIjh_8eKnvHOKM7R7M-801" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="236" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-805" parent="mmNIjh_8eKnvHOKM7R7M-792" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="278" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-806" parent="mmNIjh_8eKnvHOKM7R7M-805" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-807" parent="mmNIjh_8eKnvHOKM7R7M-805" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="tipo" vertex="1">
          <mxGeometry height="40" width="150" x="86" as="geometry">
            <mxRectangle height="40" width="150" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-808" parent="mmNIjh_8eKnvHOKM7R7M-805" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="236" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-809" parent="mmNIjh_8eKnvHOKM7R7M-792" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="278" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-810" parent="mmNIjh_8eKnvHOKM7R7M-809" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-811" parent="mmNIjh_8eKnvHOKM7R7M-809" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="configuracao" vertex="1">
          <mxGeometry height="40" width="150" x="86" as="geometry">
            <mxRectangle height="40" width="150" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-812" parent="mmNIjh_8eKnvHOKM7R7M-809" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="236" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-813" parent="mmNIjh_8eKnvHOKM7R7M-792" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="278" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-814" parent="mmNIjh_8eKnvHOKM7R7M-813" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="INT" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-815" parent="mmNIjh_8eKnvHOKM7R7M-813" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="ordem" vertex="1">
          <mxGeometry height="40" width="150" x="86" as="geometry">
            <mxRectangle height="40" width="150" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-816" parent="mmNIjh_8eKnvHOKM7R7M-813" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="236" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="EXECUCAO_PIPELINE" mermaidId="n:EXECUCAO_PIPELINE" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF1F2;strokeColor=#FB7185;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="EXECUCAO_PIPELINE" id="mmNIjh_8eKnvHOKM7R7M-817">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF1F2;strokeColor=#FB7185;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="318" x="4606" y="1799" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-818" parent="mmNIjh_8eKnvHOKM7R7M-817" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-819" parent="mmNIjh_8eKnvHOKM7R7M-818" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-820" parent="mmNIjh_8eKnvHOKM7R7M-818" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="execucao_pipeline_id" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-821" parent="mmNIjh_8eKnvHOKM7R7M-818" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-822" parent="mmNIjh_8eKnvHOKM7R7M-817" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-823" parent="mmNIjh_8eKnvHOKM7R7M-822" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-824" parent="mmNIjh_8eKnvHOKM7R7M-822" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="pipeline_id" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-825" parent="mmNIjh_8eKnvHOKM7R7M-822" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-826" parent="mmNIjh_8eKnvHOKM7R7M-817" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-827" parent="mmNIjh_8eKnvHOKM7R7M-826" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-828" parent="mmNIjh_8eKnvHOKM7R7M-826" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="status" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-829" parent="mmNIjh_8eKnvHOKM7R7M-826" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-830" parent="mmNIjh_8eKnvHOKM7R7M-817" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-831" parent="mmNIjh_8eKnvHOKM7R7M-830" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-832" parent="mmNIjh_8eKnvHOKM7R7M-830" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="iniciada_em" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-833" parent="mmNIjh_8eKnvHOKM7R7M-830" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-834" parent="mmNIjh_8eKnvHOKM7R7M-817" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-835" parent="mmNIjh_8eKnvHOKM7R7M-834" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-836" parent="mmNIjh_8eKnvHOKM7R7M-834" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="concluida_em" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-837" parent="mmNIjh_8eKnvHOKM7R7M-834" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="EXECUCAO_ETAPA" mermaidId="n:EXECUCAO_ETAPA" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FDF4FF;strokeColor=#E879F9;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="EXECUCAO_ETAPA" id="mmNIjh_8eKnvHOKM7R7M-838">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FDF4FF;strokeColor=#E879F9;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="319" width="318" x="4375" y="2285" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-839" parent="mmNIjh_8eKnvHOKM7R7M-838" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-840" parent="mmNIjh_8eKnvHOKM7R7M-839" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-841" parent="mmNIjh_8eKnvHOKM7R7M-839" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="execucao_etapa_id" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-842" parent="mmNIjh_8eKnvHOKM7R7M-839" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-843" parent="mmNIjh_8eKnvHOKM7R7M-838" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-844" parent="mmNIjh_8eKnvHOKM7R7M-843" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-845" parent="mmNIjh_8eKnvHOKM7R7M-843" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="execucao_pipeline_id" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-846" parent="mmNIjh_8eKnvHOKM7R7M-843" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-847" parent="mmNIjh_8eKnvHOKM7R7M-838" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-848" parent="mmNIjh_8eKnvHOKM7R7M-847" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-849" parent="mmNIjh_8eKnvHOKM7R7M-847" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="etapa_pipeline_id" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-850" parent="mmNIjh_8eKnvHOKM7R7M-847" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-851" parent="mmNIjh_8eKnvHOKM7R7M-838" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-852" parent="mmNIjh_8eKnvHOKM7R7M-851" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-853" parent="mmNIjh_8eKnvHOKM7R7M-851" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="status" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-854" parent="mmNIjh_8eKnvHOKM7R7M-851" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-855" parent="mmNIjh_8eKnvHOKM7R7M-838" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-856" parent="mmNIjh_8eKnvHOKM7R7M-855" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-857" parent="mmNIjh_8eKnvHOKM7R7M-855" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="resultado" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-858" parent="mmNIjh_8eKnvHOKM7R7M-855" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-859" parent="mmNIjh_8eKnvHOKM7R7M-838" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-860" parent="mmNIjh_8eKnvHOKM7R7M-859" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-861" parent="mmNIjh_8eKnvHOKM7R7M-859" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="iniciada_em" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-862" parent="mmNIjh_8eKnvHOKM7R7M-859" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-863" parent="mmNIjh_8eKnvHOKM7R7M-838" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="279" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-864" parent="mmNIjh_8eKnvHOKM7R7M-863" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-865" parent="mmNIjh_8eKnvHOKM7R7M-863" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="concluida_em" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-866" parent="mmNIjh_8eKnvHOKM7R7M-863" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="AMBIENTE_DEPLOY" mermaidId="n:AMBIENTE_DEPLOY" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="AMBIENTE_DEPLOY" id="mmNIjh_8eKnvHOKM7R7M-867">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="239" x="3652" y="2742" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-868" parent="mmNIjh_8eKnvHOKM7R7M-867" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="239" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-869" parent="mmNIjh_8eKnvHOKM7R7M-868" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-870" parent="mmNIjh_8eKnvHOKM7R7M-868" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="ambiente_id" vertex="1">
          <mxGeometry height="40" width="111" x="86" as="geometry">
            <mxRectangle height="40" width="111" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-871" parent="mmNIjh_8eKnvHOKM7R7M-868" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="197" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-872" parent="mmNIjh_8eKnvHOKM7R7M-867" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="239" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-873" parent="mmNIjh_8eKnvHOKM7R7M-872" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-874" parent="mmNIjh_8eKnvHOKM7R7M-872" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="111" x="86" as="geometry">
            <mxRectangle height="40" width="111" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-875" parent="mmNIjh_8eKnvHOKM7R7M-872" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="197" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-876" parent="mmNIjh_8eKnvHOKM7R7M-867" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="239" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-877" parent="mmNIjh_8eKnvHOKM7R7M-876" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-878" parent="mmNIjh_8eKnvHOKM7R7M-876" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="111" x="86" as="geometry">
            <mxRectangle height="40" width="111" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-879" parent="mmNIjh_8eKnvHOKM7R7M-876" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="197" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-880" parent="mmNIjh_8eKnvHOKM7R7M-867" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="239" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-881" parent="mmNIjh_8eKnvHOKM7R7M-880" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-882" parent="mmNIjh_8eKnvHOKM7R7M-880" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="tipo" vertex="1">
          <mxGeometry height="40" width="111" x="86" as="geometry">
            <mxRectangle height="40" width="111" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-883" parent="mmNIjh_8eKnvHOKM7R7M-880" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="197" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-884" parent="mmNIjh_8eKnvHOKM7R7M-867" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="239" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-885" parent="mmNIjh_8eKnvHOKM7R7M-884" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-886" parent="mmNIjh_8eKnvHOKM7R7M-884" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="regiao" vertex="1">
          <mxGeometry height="40" width="111" x="86" as="geometry">
            <mxRectangle height="40" width="111" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-887" parent="mmNIjh_8eKnvHOKM7R7M-884" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="197" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="DEPLOYMENT" mermaidId="n:DEPLOYMENT" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF7ED;strokeColor=#FB923C;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="DEPLOYMENT" id="mmNIjh_8eKnvHOKM7R7M-888">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF7ED;strokeColor=#FB923C;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="319" width="296" x="2617" y="3879" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-889" parent="mmNIjh_8eKnvHOKM7R7M-888" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-890" parent="mmNIjh_8eKnvHOKM7R7M-889" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-891" parent="mmNIjh_8eKnvHOKM7R7M-889" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="deployment_id" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-892" parent="mmNIjh_8eKnvHOKM7R7M-889" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-893" parent="mmNIjh_8eKnvHOKM7R7M-888" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-894" parent="mmNIjh_8eKnvHOKM7R7M-893" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-895" parent="mmNIjh_8eKnvHOKM7R7M-893" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="ambiente_id" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-896" parent="mmNIjh_8eKnvHOKM7R7M-893" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-897" parent="mmNIjh_8eKnvHOKM7R7M-888" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-898" parent="mmNIjh_8eKnvHOKM7R7M-897" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-899" parent="mmNIjh_8eKnvHOKM7R7M-897" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_modelo_id" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-900" parent="mmNIjh_8eKnvHOKM7R7M-897" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-901" parent="mmNIjh_8eKnvHOKM7R7M-888" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-902" parent="mmNIjh_8eKnvHOKM7R7M-901" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-903" parent="mmNIjh_8eKnvHOKM7R7M-901" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="executado_por" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-904" parent="mmNIjh_8eKnvHOKM7R7M-901" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-905" parent="mmNIjh_8eKnvHOKM7R7M-888" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-906" parent="mmNIjh_8eKnvHOKM7R7M-905" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-907" parent="mmNIjh_8eKnvHOKM7R7M-905" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="status" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-908" parent="mmNIjh_8eKnvHOKM7R7M-905" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-909" parent="mmNIjh_8eKnvHOKM7R7M-888" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-910" parent="mmNIjh_8eKnvHOKM7R7M-909" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-911" parent="mmNIjh_8eKnvHOKM7R7M-909" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="endpoint" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-912" parent="mmNIjh_8eKnvHOKM7R7M-909" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-913" parent="mmNIjh_8eKnvHOKM7R7M-888" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF7ED;strokeColor=#FB923C;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="279" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-914" parent="mmNIjh_8eKnvHOKM7R7M-913" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-915" parent="mmNIjh_8eKnvHOKM7R7M-913" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="implantado_em" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-916" parent="mmNIjh_8eKnvHOKM7R7M-913" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB923C;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="ENDPOINT_MODELO" mermaidId="n:ENDPOINT_MODELO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#ECFEFF;strokeColor=#22D3EE;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="ENDPOINT_MODELO" id="mmNIjh_8eKnvHOKM7R7M-917">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#ECFEFF;strokeColor=#22D3EE;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="256" x="2328" y="4298" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-918" parent="mmNIjh_8eKnvHOKM7R7M-917" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="256" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-919" parent="mmNIjh_8eKnvHOKM7R7M-918" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-920" parent="mmNIjh_8eKnvHOKM7R7M-918" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="endpoint_id" vertex="1">
          <mxGeometry height="40" width="128" x="86" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-921" parent="mmNIjh_8eKnvHOKM7R7M-918" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="214" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-922" parent="mmNIjh_8eKnvHOKM7R7M-917" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="256" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-923" parent="mmNIjh_8eKnvHOKM7R7M-922" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-924" parent="mmNIjh_8eKnvHOKM7R7M-922" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="deployment_id" vertex="1">
          <mxGeometry height="40" width="128" x="86" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-925" parent="mmNIjh_8eKnvHOKM7R7M-922" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="214" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-926" parent="mmNIjh_8eKnvHOKM7R7M-917" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="256" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-927" parent="mmNIjh_8eKnvHOKM7R7M-926" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-928" parent="mmNIjh_8eKnvHOKM7R7M-926" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="uri" vertex="1">
          <mxGeometry height="40" width="128" x="86" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-929" parent="mmNIjh_8eKnvHOKM7R7M-926" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="214" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-930" parent="mmNIjh_8eKnvHOKM7R7M-917" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="256" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-931" parent="mmNIjh_8eKnvHOKM7R7M-930" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-932" parent="mmNIjh_8eKnvHOKM7R7M-930" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="metodo" vertex="1">
          <mxGeometry height="40" width="128" x="86" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-933" parent="mmNIjh_8eKnvHOKM7R7M-930" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="214" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-934" parent="mmNIjh_8eKnvHOKM7R7M-917" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#ECFEFF;strokeColor=#22D3EE;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="256" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-935" parent="mmNIjh_8eKnvHOKM7R7M-934" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="BOOLEAN" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-936" parent="mmNIjh_8eKnvHOKM7R7M-934" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="ativo" vertex="1">
          <mxGeometry height="40" width="128" x="86" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-937" parent="mmNIjh_8eKnvHOKM7R7M-934" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#22D3EE;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="214" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="POLITICA_GOVERNANCA" mermaidId="n:POLITICA_GOVERNANCA" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDF4;strokeColor=#4ADE80;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="POLITICA_GOVERNANCA" id="mmNIjh_8eKnvHOKM7R7M-938">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDF4;strokeColor=#4ADE80;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="244" x="3802" y="3040" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-939" parent="mmNIjh_8eKnvHOKM7R7M-938" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-940" parent="mmNIjh_8eKnvHOKM7R7M-939" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-941" parent="mmNIjh_8eKnvHOKM7R7M-939" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="politica_id" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-942" parent="mmNIjh_8eKnvHOKM7R7M-939" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-943" parent="mmNIjh_8eKnvHOKM7R7M-938" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-944" parent="mmNIjh_8eKnvHOKM7R7M-943" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-945" parent="mmNIjh_8eKnvHOKM7R7M-943" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-946" parent="mmNIjh_8eKnvHOKM7R7M-943" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-947" parent="mmNIjh_8eKnvHOKM7R7M-938" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-948" parent="mmNIjh_8eKnvHOKM7R7M-947" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-949" parent="mmNIjh_8eKnvHOKM7R7M-947" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-950" parent="mmNIjh_8eKnvHOKM7R7M-947" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-951" parent="mmNIjh_8eKnvHOKM7R7M-938" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-952" parent="mmNIjh_8eKnvHOKM7R7M-951" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TEXT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-953" parent="mmNIjh_8eKnvHOKM7R7M-951" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="descricao" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-954" parent="mmNIjh_8eKnvHOKM7R7M-951" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-955" parent="mmNIjh_8eKnvHOKM7R7M-938" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-956" parent="mmNIjh_8eKnvHOKM7R7M-955" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-957" parent="mmNIjh_8eKnvHOKM7R7M-955" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="regras" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-958" parent="mmNIjh_8eKnvHOKM7R7M-955" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-959" parent="mmNIjh_8eKnvHOKM7R7M-938" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDF4;strokeColor=#4ADE80;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="244" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-960" parent="mmNIjh_8eKnvHOKM7R7M-959" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-961" parent="mmNIjh_8eKnvHOKM7R7M-959" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="criada_em" vertex="1">
          <mxGeometry height="40" width="99" x="103" as="geometry">
            <mxRectangle height="40" width="99" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-962" parent="mmNIjh_8eKnvHOKM7R7M-959" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#4ADE80;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="202" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="REVISAO_GOVERNANCA" mermaidId="n:REVISAO_GOVERNANCA" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F5F3FF;strokeColor=#A78BFA;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="REVISAO_GOVERNANCA" id="mmNIjh_8eKnvHOKM7R7M-963">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F5F3FF;strokeColor=#A78BFA;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="319" width="296" x="3977" y="3879" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-964" parent="mmNIjh_8eKnvHOKM7R7M-963" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-965" parent="mmNIjh_8eKnvHOKM7R7M-964" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-966" parent="mmNIjh_8eKnvHOKM7R7M-964" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="revisao_id" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-967" parent="mmNIjh_8eKnvHOKM7R7M-964" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-968" parent="mmNIjh_8eKnvHOKM7R7M-963" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-969" parent="mmNIjh_8eKnvHOKM7R7M-968" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-970" parent="mmNIjh_8eKnvHOKM7R7M-968" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="politica_id" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-971" parent="mmNIjh_8eKnvHOKM7R7M-968" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-972" parent="mmNIjh_8eKnvHOKM7R7M-963" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-973" parent="mmNIjh_8eKnvHOKM7R7M-972" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-974" parent="mmNIjh_8eKnvHOKM7R7M-972" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="versao_modelo_id" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-975" parent="mmNIjh_8eKnvHOKM7R7M-972" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-976" parent="mmNIjh_8eKnvHOKM7R7M-963" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-977" parent="mmNIjh_8eKnvHOKM7R7M-976" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-978" parent="mmNIjh_8eKnvHOKM7R7M-976" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="revisor_id" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-979" parent="mmNIjh_8eKnvHOKM7R7M-976" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-980" parent="mmNIjh_8eKnvHOKM7R7M-963" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-981" parent="mmNIjh_8eKnvHOKM7R7M-980" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-982" parent="mmNIjh_8eKnvHOKM7R7M-980" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="resultado" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-983" parent="mmNIjh_8eKnvHOKM7R7M-980" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-984" parent="mmNIjh_8eKnvHOKM7R7M-963" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-985" parent="mmNIjh_8eKnvHOKM7R7M-984" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TEXT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-986" parent="mmNIjh_8eKnvHOKM7R7M-984" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="observacoes" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-987" parent="mmNIjh_8eKnvHOKM7R7M-984" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-988" parent="mmNIjh_8eKnvHOKM7R7M-963" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F5F3FF;strokeColor=#A78BFA;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="296" y="279" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-989" parent="mmNIjh_8eKnvHOKM7R7M-988" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-990" parent="mmNIjh_8eKnvHOKM7R7M-988" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="revisada_em" vertex="1">
          <mxGeometry height="40" width="151" x="103" as="geometry">
            <mxRectangle height="40" width="151" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-991" parent="mmNIjh_8eKnvHOKM7R7M-988" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A78BFA;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="254" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="METRICA_MONITORAMENTO" mermaidId="n:METRICA_MONITORAMENTO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEF2F2;strokeColor=#F87171;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="METRICA_MONITORAMENTO" id="mmNIjh_8eKnvHOKM7R7M-992">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEF2F2;strokeColor=#F87171;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="239" width="273" x="2624" y="4298" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-993" parent="mmNIjh_8eKnvHOKM7R7M-992" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="273" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-994" parent="mmNIjh_8eKnvHOKM7R7M-993" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-995" parent="mmNIjh_8eKnvHOKM7R7M-993" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="metrica_id" vertex="1">
          <mxGeometry height="40" width="128" x="103" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-996" parent="mmNIjh_8eKnvHOKM7R7M-993" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="231" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-997" parent="mmNIjh_8eKnvHOKM7R7M-992" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="273" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-998" parent="mmNIjh_8eKnvHOKM7R7M-997" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-999" parent="mmNIjh_8eKnvHOKM7R7M-997" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="deployment_id" vertex="1">
          <mxGeometry height="40" width="128" x="103" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1000" parent="mmNIjh_8eKnvHOKM7R7M-997" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="231" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1001" parent="mmNIjh_8eKnvHOKM7R7M-992" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="273" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1002" parent="mmNIjh_8eKnvHOKM7R7M-1001" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1003" parent="mmNIjh_8eKnvHOKM7R7M-1001" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="128" x="103" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1004" parent="mmNIjh_8eKnvHOKM7R7M-1001" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="231" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1005" parent="mmNIjh_8eKnvHOKM7R7M-992" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="273" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1006" parent="mmNIjh_8eKnvHOKM7R7M-1005" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FLOAT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1007" parent="mmNIjh_8eKnvHOKM7R7M-1005" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="valor" vertex="1">
          <mxGeometry height="40" width="128" x="103" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1008" parent="mmNIjh_8eKnvHOKM7R7M-1005" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="231" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1009" parent="mmNIjh_8eKnvHOKM7R7M-992" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEF2F2;strokeColor=#F87171;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="273" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1010" parent="mmNIjh_8eKnvHOKM7R7M-1009" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1011" parent="mmNIjh_8eKnvHOKM7R7M-1009" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="coletada_em" vertex="1">
          <mxGeometry height="40" width="128" x="103" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1012" parent="mmNIjh_8eKnvHOKM7R7M-1009" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#F87171;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="231" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="ALERTA" mermaidId="n:ALERTA" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEFCE8;strokeColor=#FACC15;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="ALERTA" id="mmNIjh_8eKnvHOKM7R7M-1013">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FEFCE8;strokeColor=#FACC15;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="273" x="2937" y="4298" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1014" parent="mmNIjh_8eKnvHOKM7R7M-1013" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="273" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1015" parent="mmNIjh_8eKnvHOKM7R7M-1014" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1016" parent="mmNIjh_8eKnvHOKM7R7M-1014" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="alerta_id" vertex="1">
          <mxGeometry height="40" width="128" x="103" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1017" parent="mmNIjh_8eKnvHOKM7R7M-1014" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="231" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1018" parent="mmNIjh_8eKnvHOKM7R7M-1013" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="273" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1019" parent="mmNIjh_8eKnvHOKM7R7M-1018" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1020" parent="mmNIjh_8eKnvHOKM7R7M-1018" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="deployment_id" vertex="1">
          <mxGeometry height="40" width="128" x="103" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1021" parent="mmNIjh_8eKnvHOKM7R7M-1018" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="231" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1022" parent="mmNIjh_8eKnvHOKM7R7M-1013" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="273" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1023" parent="mmNIjh_8eKnvHOKM7R7M-1022" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1024" parent="mmNIjh_8eKnvHOKM7R7M-1022" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="severidade" vertex="1">
          <mxGeometry height="40" width="128" x="103" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1025" parent="mmNIjh_8eKnvHOKM7R7M-1022" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="231" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1026" parent="mmNIjh_8eKnvHOKM7R7M-1013" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="273" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1027" parent="mmNIjh_8eKnvHOKM7R7M-1026" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TEXT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1028" parent="mmNIjh_8eKnvHOKM7R7M-1026" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="mensagem" vertex="1">
          <mxGeometry height="40" width="128" x="103" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1029" parent="mmNIjh_8eKnvHOKM7R7M-1026" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="231" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1030" parent="mmNIjh_8eKnvHOKM7R7M-1013" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="273" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1031" parent="mmNIjh_8eKnvHOKM7R7M-1030" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1032" parent="mmNIjh_8eKnvHOKM7R7M-1030" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="disparado_em" vertex="1">
          <mxGeometry height="40" width="128" x="103" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1033" parent="mmNIjh_8eKnvHOKM7R7M-1030" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="231" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1034" parent="mmNIjh_8eKnvHOKM7R7M-1013" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FEFCE8;strokeColor=#FACC15;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="273" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1035" parent="mmNIjh_8eKnvHOKM7R7M-1034" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1036" parent="mmNIjh_8eKnvHOKM7R7M-1034" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="resolvido_em" vertex="1">
          <mxGeometry height="40" width="128" x="103" as="geometry">
            <mxRectangle height="40" width="128" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1037" parent="mmNIjh_8eKnvHOKM7R7M-1034" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FACC15;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="231" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="REGISTRO_AUDITORIA" mermaidId="n:REGISTRO_AUDITORIA" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#EEF2FF;strokeColor=#818CF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="REGISTRO_AUDITORIA" id="mmNIjh_8eKnvHOKM7R7M-1038">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#EEF2FF;strokeColor=#818CF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="256" x="5857" y="1089" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1039" parent="mmNIjh_8eKnvHOKM7R7M-1038" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="256" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1040" parent="mmNIjh_8eKnvHOKM7R7M-1039" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1041" parent="mmNIjh_8eKnvHOKM7R7M-1039" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="auditoria_id" vertex="1">
          <mxGeometry height="40" width="111" x="103" as="geometry">
            <mxRectangle height="40" width="111" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1042" parent="mmNIjh_8eKnvHOKM7R7M-1039" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="214" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1043" parent="mmNIjh_8eKnvHOKM7R7M-1038" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="256" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1044" parent="mmNIjh_8eKnvHOKM7R7M-1043" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1045" parent="mmNIjh_8eKnvHOKM7R7M-1043" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="usuario_id" vertex="1">
          <mxGeometry height="40" width="111" x="103" as="geometry">
            <mxRectangle height="40" width="111" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1046" parent="mmNIjh_8eKnvHOKM7R7M-1043" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="214" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1047" parent="mmNIjh_8eKnvHOKM7R7M-1038" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="256" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1048" parent="mmNIjh_8eKnvHOKM7R7M-1047" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1049" parent="mmNIjh_8eKnvHOKM7R7M-1047" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="111" x="103" as="geometry">
            <mxRectangle height="40" width="111" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1050" parent="mmNIjh_8eKnvHOKM7R7M-1047" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="214" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1051" parent="mmNIjh_8eKnvHOKM7R7M-1038" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="256" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1052" parent="mmNIjh_8eKnvHOKM7R7M-1051" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1053" parent="mmNIjh_8eKnvHOKM7R7M-1051" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="acao" vertex="1">
          <mxGeometry height="40" width="111" x="103" as="geometry">
            <mxRectangle height="40" width="111" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1054" parent="mmNIjh_8eKnvHOKM7R7M-1051" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="214" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1055" parent="mmNIjh_8eKnvHOKM7R7M-1038" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="256" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1056" parent="mmNIjh_8eKnvHOKM7R7M-1055" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1057" parent="mmNIjh_8eKnvHOKM7R7M-1055" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="detalhes" vertex="1">
          <mxGeometry height="40" width="111" x="103" as="geometry">
            <mxRectangle height="40" width="111" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1058" parent="mmNIjh_8eKnvHOKM7R7M-1055" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="214" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1059" parent="mmNIjh_8eKnvHOKM7R7M-1038" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#EEF2FF;strokeColor=#818CF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="256" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1060" parent="mmNIjh_8eKnvHOKM7R7M-1059" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1061" parent="mmNIjh_8eKnvHOKM7R7M-1059" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="ocorrido_em" vertex="1">
          <mxGeometry height="40" width="111" x="103" as="geometry">
            <mxRectangle height="40" width="111" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1062" parent="mmNIjh_8eKnvHOKM7R7M-1059" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#818CF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="214" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="REGISTRO_LOG" mermaidId="n:REGISTRO_LOG" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F7FEE7;strokeColor=#A3E635;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="REGISTRO_LOG" id="mmNIjh_8eKnvHOKM7R7M-1063">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F7FEE7;strokeColor=#A3E635;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="318" x="5158" y="3021" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1064" parent="mmNIjh_8eKnvHOKM7R7M-1063" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1065" parent="mmNIjh_8eKnvHOKM7R7M-1064" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1066" parent="mmNIjh_8eKnvHOKM7R7M-1064" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="log_id" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1067" parent="mmNIjh_8eKnvHOKM7R7M-1064" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1068" parent="mmNIjh_8eKnvHOKM7R7M-1063" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1069" parent="mmNIjh_8eKnvHOKM7R7M-1068" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1070" parent="mmNIjh_8eKnvHOKM7R7M-1068" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="execucao_pipeline_id" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1071" parent="mmNIjh_8eKnvHOKM7R7M-1068" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1072" parent="mmNIjh_8eKnvHOKM7R7M-1063" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1073" parent="mmNIjh_8eKnvHOKM7R7M-1072" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1074" parent="mmNIjh_8eKnvHOKM7R7M-1072" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="execucao_prompt_id" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1075" parent="mmNIjh_8eKnvHOKM7R7M-1072" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1076" parent="mmNIjh_8eKnvHOKM7R7M-1063" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1077" parent="mmNIjh_8eKnvHOKM7R7M-1076" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1078" parent="mmNIjh_8eKnvHOKM7R7M-1076" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nivel" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1079" parent="mmNIjh_8eKnvHOKM7R7M-1076" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1080" parent="mmNIjh_8eKnvHOKM7R7M-1063" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1081" parent="mmNIjh_8eKnvHOKM7R7M-1080" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TEXT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1082" parent="mmNIjh_8eKnvHOKM7R7M-1080" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="mensagem" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1083" parent="mmNIjh_8eKnvHOKM7R7M-1080" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1084" parent="mmNIjh_8eKnvHOKM7R7M-1063" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F7FEE7;strokeColor=#A3E635;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="318" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1085" parent="mmNIjh_8eKnvHOKM7R7M-1084" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1086" parent="mmNIjh_8eKnvHOKM7R7M-1084" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="ocorrido_em" vertex="1">
          <mxGeometry height="40" width="173" x="103" as="geometry">
            <mxRectangle height="40" width="173" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1087" parent="mmNIjh_8eKnvHOKM7R7M-1084" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#A3E635;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="276" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="PLANO_FATURAMENTO" mermaidId="n:PLANO_FATURAMENTO" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0F9FF;strokeColor=#38BDF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="PLANO_FATURAMENTO" id="mmNIjh_8eKnvHOKM7R7M-1088">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0F9FF;strokeColor=#38BDF8;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="199" width="248" x="4290" y="629" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1089" parent="mmNIjh_8eKnvHOKM7R7M-1088" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="248" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1090" parent="mmNIjh_8eKnvHOKM7R7M-1089" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1091" parent="mmNIjh_8eKnvHOKM7R7M-1089" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="plano_id" vertex="1">
          <mxGeometry height="40" width="120" x="86" as="geometry">
            <mxRectangle height="40" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1092" parent="mmNIjh_8eKnvHOKM7R7M-1089" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="206" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1093" parent="mmNIjh_8eKnvHOKM7R7M-1088" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="248" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1094" parent="mmNIjh_8eKnvHOKM7R7M-1093" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1095" parent="mmNIjh_8eKnvHOKM7R7M-1093" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="nome" vertex="1">
          <mxGeometry height="40" width="120" x="86" as="geometry">
            <mxRectangle height="40" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1096" parent="mmNIjh_8eKnvHOKM7R7M-1093" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="206" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1097" parent="mmNIjh_8eKnvHOKM7R7M-1088" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="248" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1098" parent="mmNIjh_8eKnvHOKM7R7M-1097" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="DECIMAL" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1099" parent="mmNIjh_8eKnvHOKM7R7M-1097" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="preco_mensal" vertex="1">
          <mxGeometry height="40" width="120" x="86" as="geometry">
            <mxRectangle height="40" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1100" parent="mmNIjh_8eKnvHOKM7R7M-1097" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="206" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1101" parent="mmNIjh_8eKnvHOKM7R7M-1088" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0F9FF;strokeColor=#38BDF8;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="248" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1102" parent="mmNIjh_8eKnvHOKM7R7M-1101" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="JSONB" vertex="1">
          <mxGeometry height="40" width="86" as="geometry">
            <mxRectangle height="40" width="86" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1103" parent="mmNIjh_8eKnvHOKM7R7M-1101" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="limites" vertex="1">
          <mxGeometry height="40" width="120" x="86" as="geometry">
            <mxRectangle height="40" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1104" parent="mmNIjh_8eKnvHOKM7R7M-1101" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#38BDF8;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="206" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="ASSINATURA" mermaidId="n:ASSINATURA" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF1F2;strokeColor=#FB7185;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="ASSINATURA" id="mmNIjh_8eKnvHOKM7R7M-1105">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FFF1F2;strokeColor=#FB7185;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="279" width="266" x="4057" y="1109" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1106" parent="mmNIjh_8eKnvHOKM7R7M-1105" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="266" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1107" parent="mmNIjh_8eKnvHOKM7R7M-1106" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1108" parent="mmNIjh_8eKnvHOKM7R7M-1106" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="assinatura_id" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1109" parent="mmNIjh_8eKnvHOKM7R7M-1106" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="224" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1110" parent="mmNIjh_8eKnvHOKM7R7M-1105" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="266" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1111" parent="mmNIjh_8eKnvHOKM7R7M-1110" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1112" parent="mmNIjh_8eKnvHOKM7R7M-1110" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="projeto_id" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1113" parent="mmNIjh_8eKnvHOKM7R7M-1110" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="224" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1114" parent="mmNIjh_8eKnvHOKM7R7M-1105" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="266" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1115" parent="mmNIjh_8eKnvHOKM7R7M-1114" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1116" parent="mmNIjh_8eKnvHOKM7R7M-1114" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="plano_id" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1117" parent="mmNIjh_8eKnvHOKM7R7M-1114" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="224" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1118" parent="mmNIjh_8eKnvHOKM7R7M-1105" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="266" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1119" parent="mmNIjh_8eKnvHOKM7R7M-1118" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1120" parent="mmNIjh_8eKnvHOKM7R7M-1118" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="status" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1121" parent="mmNIjh_8eKnvHOKM7R7M-1118" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="224" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1122" parent="mmNIjh_8eKnvHOKM7R7M-1105" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="266" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1123" parent="mmNIjh_8eKnvHOKM7R7M-1122" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1124" parent="mmNIjh_8eKnvHOKM7R7M-1122" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="inicio_em" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1125" parent="mmNIjh_8eKnvHOKM7R7M-1122" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="224" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1126" parent="mmNIjh_8eKnvHOKM7R7M-1105" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FFF1F2;strokeColor=#FB7185;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="266" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1127" parent="mmNIjh_8eKnvHOKM7R7M-1126" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1128" parent="mmNIjh_8eKnvHOKM7R7M-1126" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="fim_em" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1129" parent="mmNIjh_8eKnvHOKM7R7M-1126" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#FB7185;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="224" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="USO_TOKEN" mermaidId="n:USO_TOKEN" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FDF4FF;strokeColor=#E879F9;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="USO_TOKEN" id="mmNIjh_8eKnvHOKM7R7M-1130">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#FDF4FF;strokeColor=#E879F9;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="319" width="312" x="4360" y="3021" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1131" parent="mmNIjh_8eKnvHOKM7R7M-1130" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1132" parent="mmNIjh_8eKnvHOKM7R7M-1131" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1133" parent="mmNIjh_8eKnvHOKM7R7M-1131" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="uso_token_id" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1134" parent="mmNIjh_8eKnvHOKM7R7M-1131" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1135" parent="mmNIjh_8eKnvHOKM7R7M-1130" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1136" parent="mmNIjh_8eKnvHOKM7R7M-1135" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1137" parent="mmNIjh_8eKnvHOKM7R7M-1135" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="execucao_prompt_id" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1138" parent="mmNIjh_8eKnvHOKM7R7M-1135" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1139" parent="mmNIjh_8eKnvHOKM7R7M-1130" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1140" parent="mmNIjh_8eKnvHOKM7R7M-1139" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1141" parent="mmNIjh_8eKnvHOKM7R7M-1139" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="assinatura_id" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1142" parent="mmNIjh_8eKnvHOKM7R7M-1139" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1143" parent="mmNIjh_8eKnvHOKM7R7M-1130" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1144" parent="mmNIjh_8eKnvHOKM7R7M-1143" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="INT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1145" parent="mmNIjh_8eKnvHOKM7R7M-1143" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="tokens_entrada" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1146" parent="mmNIjh_8eKnvHOKM7R7M-1143" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1147" parent="mmNIjh_8eKnvHOKM7R7M-1130" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1148" parent="mmNIjh_8eKnvHOKM7R7M-1147" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="INT" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1149" parent="mmNIjh_8eKnvHOKM7R7M-1147" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="tokens_saida" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1150" parent="mmNIjh_8eKnvHOKM7R7M-1147" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1151" parent="mmNIjh_8eKnvHOKM7R7M-1130" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1152" parent="mmNIjh_8eKnvHOKM7R7M-1151" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="DECIMAL" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1153" parent="mmNIjh_8eKnvHOKM7R7M-1151" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="custo" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1154" parent="mmNIjh_8eKnvHOKM7R7M-1151" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1155" parent="mmNIjh_8eKnvHOKM7R7M-1130" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#FDF4FF;strokeColor=#E879F9;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="312" y="279" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1156" parent="mmNIjh_8eKnvHOKM7R7M-1155" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1157" parent="mmNIjh_8eKnvHOKM7R7M-1155" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="registrado_em" vertex="1">
          <mxGeometry height="40" width="167" x="103" as="geometry">
            <mxRectangle height="40" width="167" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1158" parent="mmNIjh_8eKnvHOKM7R7M-1155" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#E879F9;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="42" x="270" as="geometry">
            <mxRectangle height="40" width="42" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="FATURA" mermaidId="n:FATURA" mermaidBaseStyle="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=16;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;" mermaidBaseValue="FATURA" id="mmNIjh_8eKnvHOKM7R7M-1159">
          <mxCell parent="mmNIjh_8eKnvHOKM7R7M-1" style="shape=table;startSize=39.75;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=1;fontSize=14;fontFamily=Recursive;strokeWidth=2;align=center;resizeLast=1;html=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;fontColor=#28253D;shadow=1;shadowColor=#000000;shadowOffsetX=4;shadowOffsetY=4;shadowBlur=0;shadowOpacity=6;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" vertex="1">
            <mxGeometry height="319" width="267" x="3980" y="1746" as="geometry" />
          </mxCell>
        </UserObject>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1160" parent="mmNIjh_8eKnvHOKM7R7M-1159" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="267" y="39" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1161" parent="mmNIjh_8eKnvHOKM7R7M-1160" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1162" parent="mmNIjh_8eKnvHOKM7R7M-1160" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="fatura_id" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1163" parent="mmNIjh_8eKnvHOKM7R7M-1160" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="PK" vertex="1">
          <mxGeometry height="40" width="43" x="224" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1164" parent="mmNIjh_8eKnvHOKM7R7M-1159" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="267" y="79" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1165" parent="mmNIjh_8eKnvHOKM7R7M-1164" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UUID" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1166" parent="mmNIjh_8eKnvHOKM7R7M-1164" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="assinatura_id" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1167" parent="mmNIjh_8eKnvHOKM7R7M-1164" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="FK" vertex="1">
          <mxGeometry height="40" width="43" x="224" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1168" parent="mmNIjh_8eKnvHOKM7R7M-1159" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="267" y="119" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1169" parent="mmNIjh_8eKnvHOKM7R7M-1168" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1170" parent="mmNIjh_8eKnvHOKM7R7M-1168" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="numero" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1171" parent="mmNIjh_8eKnvHOKM7R7M-1168" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="UK" vertex="1">
          <mxGeometry height="40" width="43" x="224" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1172" parent="mmNIjh_8eKnvHOKM7R7M-1159" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="267" y="159" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1173" parent="mmNIjh_8eKnvHOKM7R7M-1172" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="DECIMAL" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1174" parent="mmNIjh_8eKnvHOKM7R7M-1172" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="total" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1175" parent="mmNIjh_8eKnvHOKM7R7M-1172" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="43" x="224" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1176" parent="mmNIjh_8eKnvHOKM7R7M-1159" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="267" y="199" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1177" parent="mmNIjh_8eKnvHOKM7R7M-1176" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="VARCHAR" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1178" parent="mmNIjh_8eKnvHOKM7R7M-1176" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="status" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1179" parent="mmNIjh_8eKnvHOKM7R7M-1176" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="43" x="224" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1180" parent="mmNIjh_8eKnvHOKM7R7M-1159" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="267" y="239" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1181" parent="mmNIjh_8eKnvHOKM7R7M-1180" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="DATE" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1182" parent="mmNIjh_8eKnvHOKM7R7M-1180" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="vencimento" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1183" parent="mmNIjh_8eKnvHOKM7R7M-1180" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="43" x="224" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1184" parent="mmNIjh_8eKnvHOKM7R7M-1159" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=1;fillColor=#F0FDFA;strokeColor=#2DD4BF;strokeWidth=2;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;top=0;left=0;right=0;bottom=0;" vertex="1">
          <mxGeometry height="40" width="267" y="279" as="geometry" />
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1185" parent="mmNIjh_8eKnvHOKM7R7M-1184" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="40" width="103" as="geometry">
            <mxRectangle height="40" width="103" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1186" parent="mmNIjh_8eKnvHOKM7R7M-1184" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="emitida_em" vertex="1">
          <mxGeometry height="40" width="121" x="103" as="geometry">
            <mxRectangle height="40" width="121" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="mmNIjh_8eKnvHOKM7R7M-1187" parent="mmNIjh_8eKnvHOKM7R7M-1184" style="shape=partialRectangle;connectable=0;fillColor=none;strokeColor=#2DD4BF;strokeWidth=2;fontColor=#28253D;fontFamily=Recursive;top=1;left=1;bottom=1;right=1;align=left;spacingLeft=8;overflow=hidden;fontSize=14;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;" value="" vertex="1">
          <mxGeometry height="40" width="43" x="224" as="geometry">
            <mxRectangle height="40" width="43" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <UserObject label="recebe" mermaidId="e:USUARIO-&gt;USUARIO_PAPEL#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.68;exitY=1;entryX=0.34;entryY=0;" mermaidBaseValue="recebe" id="mmNIjh_8eKnvHOKM7R7M-1188">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.68;exitY=1;entryX=0.34;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-49">
            <mxGeometry relative="1" x="0.7046361453525234" as="geometry">
              <Array as="points">
                <mxPoint x="5316" y="469" />
                <mxPoint x="5840" y="469" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="atribuido" mermaidId="e:PAPEL-&gt;USUARIO_PAPEL#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.65;entryY=0;" mermaidBaseValue="atribuido" id="mmNIjh_8eKnvHOKM7R7M-1189">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-23" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.65;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-49">
            <mxGeometry relative="1" x="0.27131179447255604" as="geometry">
              <Array as="points">
                <mxPoint x="6010" y="469" />
                <mxPoint x="5929" y="469" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="inclui" mermaidId="e:PAPEL-&gt;PAPEL_PERMISSAO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.65;exitY=1;entryX=0.66;entryY=0;" mermaidBaseValue="inclui" id="mmNIjh_8eKnvHOKM7R7M-1190">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-23" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.65;exitY=1;entryX=0.66;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-66">
            <mxGeometry relative="1" x="0.71785983421251" as="geometry">
              <Array as="points">
                <mxPoint x="6077" y="389" />
                <mxPoint x="6636" y="389" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="concedida" mermaidId="e:PERMISSAO-&gt;PAPEL_PERMISSAO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.35;entryY=0;" mermaidBaseValue="concedida" id="mmNIjh_8eKnvHOKM7R7M-1191">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-36" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.35;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-66">
            <mxGeometry relative="1" x="0.043806941129491905" as="geometry">
              <Array as="points">
                <mxPoint x="6563" y="409" />
                <mxPoint x="6554" y="409" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="cria" mermaidId="e:USUARIO-&gt;PROJETO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.32;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="cria" id="mmNIjh_8eKnvHOKM7R7M-1192">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.32;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-79">
            <mxGeometry relative="1" x="0.868270552020082" as="geometry">
              <Array as="points">
                <mxPoint x="5230" y="449" />
                <mxPoint x="3781" y="449" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="possui" mermaidId="e:PROJETO-&gt;MEMBRO_PROJETO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.7;exitY=1;entryX=0.35;entryY=0;" mermaidBaseValue="possui" id="mmNIjh_8eKnvHOKM7R7M-1193">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.7;exitY=1;entryX=0.35;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-100">
            <mxGeometry relative="1" x="0.7992499921633585" as="geometry">
              <Array as="points">
                <mxPoint x="3830" y="928" />
                <mxPoint x="4864" y="928" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="participa" mermaidId="e:USUARIO-&gt;MEMBRO_PROJETO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.46;exitY=1;entryX=0.66;entryY=0;" mermaidBaseValue="participa" id="mmNIjh_8eKnvHOKM7R7M-1194">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.46;exitY=1;entryX=0.66;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-100">
            <mxGeometry relative="1" x="0.1329821089720813" as="geometry">
              <Array as="points">
                <mxPoint x="5264" y="489" />
                <mxPoint x="5014" y="489" />
                <mxPoint x="5014" y="539" />
                <mxPoint x="5014" y="928" />
                <mxPoint x="4933" y="928" />
                <mxPoint x="4933" y="1039" />
                <mxPoint x="4933" y="1069" />
                <mxPoint x="4959" y="1069" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="configura" mermaidId="e:PROJETO-&gt;SEGREDO_CREDENCIAL#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.29;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="configura" id="mmNIjh_8eKnvHOKM7R7M-1195">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.29;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-121">
            <mxGeometry relative="1" x="0.8334544648246467" as="geometry">
              <Array as="points">
                <mxPoint x="3731" y="928" />
                <mxPoint x="2431" y="928" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="possui" mermaidId="e:PROJETO-&gt;DATASET#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.19;exitY=1;entryX=0.66;entryY=0;" mermaidBaseValue="possui" id="mmNIjh_8eKnvHOKM7R7M-1196">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.19;exitY=1;entryX=0.66;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-142">
            <mxGeometry relative="1" x="0.8890166830691155" as="geometry">
              <Array as="points">
                <mxPoint x="3706" y="888" />
                <mxPoint x="1624" y="888" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="cria" mermaidId="e:USUARIO-&gt;DATASET#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.18;exitY=1;entryX=0.34;entryY=0;" mermaidBaseValue="cria" id="mmNIjh_8eKnvHOKM7R7M-1197">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.18;exitY=1;entryX=0.34;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-142">
            <mxGeometry relative="1" x="0.823931195196131" as="geometry">
              <Array as="points">
                <mxPoint x="5195" y="409" />
                <mxPoint x="1554" y="409" />
                <mxPoint x="1554" y="539" />
                <mxPoint x="1554" y="1039" />
                <mxPoint x="1554" y="1069" />
                <mxPoint x="1528" y="1069" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="versionado" mermaidId="e:DATASET-&gt;VERSAO_DATASET#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="versionado" id="mmNIjh_8eKnvHOKM7R7M-1198">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-142" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-171">
            <mxGeometry relative="1" x="0.35826263100725186" as="geometry">
              <Array as="points">
                <mxPoint x="1576" y="1427" />
                <mxPoint x="1368" y="1427" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="possui" mermaidId="e:PROJETO-&gt;FONTE_DADOS#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.14;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="possui" id="mmNIjh_8eKnvHOKM7R7M-1199">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.14;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-196">
            <mxGeometry relative="1" x="0.8954964830547181" as="geometry">
              <Array as="points">
                <mxPoint x="3693" y="868" />
                <mxPoint x="1244" y="868" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="usa" mermaidId="e:FONTE_DADOS-&gt;CONECTOR_DADOS#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.66;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="usa" id="mmNIjh_8eKnvHOKM7R7M-1200">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-196" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.66;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-221">
            <mxGeometry relative="1" x="0.5333335227256584" as="geometry">
              <Array as="points">
                <mxPoint x="1287" y="1447" />
                <mxPoint x="1687" y="1447" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="processada" mermaidId="e:FONTE_DADOS-&gt;EXECUCAO_INGESTAO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.65;entryY=0;" mermaidBaseValue="processada" id="mmNIjh_8eKnvHOKM7R7M-1201">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-196" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.65;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-242">
            <mxGeometry relative="1" x="-0.06771214762597122" as="geometry">
              <Array as="points">
                <mxPoint x="1201" y="1427" />
                <mxPoint x="993" y="1427" />
                <mxPoint x="993" y="1586" />
                <mxPoint x="993" y="2144" />
                <mxPoint x="1297" y="2144" />
                <mxPoint x="1297" y="2214" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="produz" mermaidId="e:VERSAO_DATASET-&gt;EXECUCAO_INGESTAO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.34;exitY=1;entryX=0.34;entryY=0;" mermaidBaseValue="produz" id="mmNIjh_8eKnvHOKM7R7M-1202">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-171" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.34;exitY=1;entryX=0.34;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-242">
            <mxGeometry relative="1" x="0.3431271638439226" as="geometry">
              <Array as="points">
                <mxPoint x="1321" y="2124" />
                <mxPoint x="1204" y="2124" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="possui" mermaidId="e:PROJETO-&gt;TRANSFORMACAO_DADOS#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.24;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="possui" id="mmNIjh_8eKnvHOKM7R7M-1203">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.24;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-267">
            <mxGeometry relative="1" x="0.6143449244941883" as="geometry">
              <Array as="points">
                <mxPoint x="3718" y="908" />
                <mxPoint x="2217" y="908" />
                <mxPoint x="2217" y="1039" />
                <mxPoint x="2217" y="1586" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="executada" mermaidId="e:TRANSFORMACAO_DADOS-&gt;EXECUCAO_TRANSFORMACAO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.74;entryY=0;" mermaidBaseValue="executada" id="mmNIjh_8eKnvHOKM7R7M-1204">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-267" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.74;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-292">
            <mxGeometry relative="1" x="0.0547323595686966" as="geometry">
              <Array as="points">
                <mxPoint x="2172" y="2104" />
                <mxPoint x="2017" y="2104" />
                <mxPoint x="2017" y="2245" />
                <mxPoint x="1890" y="2245" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="entrada" mermaidId="e:VERSAO_DATASET-&gt;EXECUCAO_TRANSFORMACAO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.45;exitY=1;entryX=0.26;entryY=0;" mermaidBaseValue="entrada" id="mmNIjh_8eKnvHOKM7R7M-1205">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-171" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.45;exitY=1;entryX=0.26;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-292">
            <mxGeometry relative="1" x="-0.6181726550349438" as="geometry">
              <Array as="points">
                <mxPoint x="1352" y="2184" />
                <mxPoint x="1639" y="2184" />
                <mxPoint x="1639" y="2265" />
                <mxPoint x="1718" y="2265" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="saida" mermaidId="e:VERSAO_DATASET-&gt;EXECUCAO_TRANSFORMACAO#1" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.55;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="saida" id="mmNIjh_8eKnvHOKM7R7M-1206">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-171" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.55;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-292">
            <mxGeometry relative="1" x="0.37582080321723454" as="geometry">
              <Array as="points">
                <mxPoint x="1383" y="2164" />
                <mxPoint x="1715" y="2164" />
                <mxPoint x="1715" y="2245" />
                <mxPoint x="1804" y="2245" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="possui" mermaidId="e:PROJETO-&gt;FEATURE_SET#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.4;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="possui" id="mmNIjh_8eKnvHOKM7R7M-1207">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.4;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-317">
            <mxGeometry relative="1" x="0.6542799623324609" as="geometry">
              <Array as="points">
                <mxPoint x="3756" y="968" />
                <mxPoint x="3164" y="968" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="contem" mermaidId="e:FEATURE_SET-&gt;FEATURE#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.66;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="contem" id="mmNIjh_8eKnvHOKM7R7M-1208">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-317" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.66;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-338">
            <mxGeometry relative="1" x="0.534923339011925" as="geometry">
              <Array as="points">
                <mxPoint x="3206" y="1427" />
                <mxPoint x="3624" y="1427" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="origem" mermaidId="e:VERSAO_DATASET-&gt;LINHAGEM_DADOS#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.65;exitY=1;entryX=0.26;entryY=0;" mermaidBaseValue="origem" id="mmNIjh_8eKnvHOKM7R7M-1209">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-171" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.65;exitY=1;entryX=0.26;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-359">
            <mxGeometry relative="1" x="0.636710182767624" as="geometry">
              <Array as="points">
                <mxPoint x="1414" y="2144" />
                <mxPoint x="2172" y="2144" />
                <mxPoint x="2172" y="2245" />
                <mxPoint x="2253" y="2245" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="destino" mermaidId="e:VERSAO_DATASET-&gt;LINHAGEM_DADOS#1" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.76;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="destino" id="mmNIjh_8eKnvHOKM7R7M-1210">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-171" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.76;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-359">
            <mxGeometry relative="1" x="0.7987077534791254" as="geometry">
              <Array as="points">
                <mxPoint x="1445" y="2124" />
                <mxPoint x="2338" y="2124" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="explica" mermaidId="e:TRANSFORMACAO_DADOS-&gt;LINHAGEM_DADOS#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.66;exitY=1;entryX=0.74;entryY=0;" mermaidBaseValue="explica" id="mmNIjh_8eKnvHOKM7R7M-1211">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-267" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.66;exitY=1;entryX=0.74;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-359">
            <mxGeometry relative="1" x="0.3728885135135136" as="geometry">
              <Array as="points">
                <mxPoint x="2262" y="2104" />
                <mxPoint x="2416" y="2104" />
                <mxPoint x="2416" y="2245" />
                <mxPoint x="2423" y="2245" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="possui" mermaidId="e:PROJETO-&gt;EXPERIMENTO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.34;exitY=1;entryX=0.66;entryY=0;" mermaidBaseValue="possui" id="mmNIjh_8eKnvHOKM7R7M-1212">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.34;exitY=1;entryX=0.66;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-380">
            <mxGeometry relative="1" x="0.7254502585571179" as="geometry">
              <Array as="points">
                <mxPoint x="3743" y="948" />
                <mxPoint x="2871" y="948" />
                <mxPoint x="2871" y="1069" />
                <mxPoint x="2892" y="1069" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="cria" mermaidId="e:USUARIO-&gt;EXPERIMENTO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.25;exitY=1;entryX=0.35;entryY=0;" mermaidBaseValue="cria" id="mmNIjh_8eKnvHOKM7R7M-1213">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.25;exitY=1;entryX=0.35;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-380">
            <mxGeometry relative="1" x="0.6488862382980365" as="geometry">
              <Array as="points">
                <mxPoint x="5212" y="429" />
                <mxPoint x="2524" y="429" />
                <mxPoint x="2524" y="539" />
                <mxPoint x="2524" y="948" />
                <mxPoint x="2806" y="948" />
                <mxPoint x="2806" y="1039" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="contem" mermaidId="e:EXPERIMENTO-&gt;EXECUCAO_EXPERIMENTO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="contem" id="mmNIjh_8eKnvHOKM7R7M-1214">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-380" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-405">
            <mxGeometry relative="1" x="-0.11484411543389372" as="geometry">
              <Array as="points">
                <mxPoint x="2806" y="1586" />
                <mxPoint x="2806" y="2214" />
                <mxPoint x="2806" y="2245" />
                <mxPoint x="2923" y="2245" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="treina_com" mermaidId="e:VERSAO_DATASET-&gt;EXECUCAO_EXPERIMENTO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.86;exitY=1;entryX=0.26;entryY=0;" mermaidBaseValue="treina_com" id="mmNIjh_8eKnvHOKM7R7M-1215">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-171" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.86;exitY=1;entryX=0.26;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-405">
            <mxGeometry relative="1" x="0.622535798512033" as="geometry">
              <Array as="points">
                <mxPoint x="1477" y="2084" />
                <mxPoint x="2656" y="2084" />
                <mxPoint x="2656" y="2265" />
                <mxPoint x="2840" y="2265" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="usa" mermaidId="e:FEATURE_SET-&gt;EXECUCAO_EXPERIMENTO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.73;entryY=0;" mermaidBaseValue="usa" id="mmNIjh_8eKnvHOKM7R7M-1216">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-317" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.73;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-405">
            <mxGeometry relative="1" x="-0.11349996969023435" as="geometry">
              <Array as="points">
                <mxPoint x="3122" y="1586" />
                <mxPoint x="3122" y="2214" />
                <mxPoint x="3122" y="2245" />
                <mxPoint x="3005" y="2245" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="gera" mermaidId="e:EXECUCAO_EXPERIMENTO-&gt;ARTEFATO_MODELO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="gera" id="mmNIjh_8eKnvHOKM7R7M-1217">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-405" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-438">
            <mxGeometry relative="1" x="-0.0014490420222186273" as="geometry">
              <Array as="points" />
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="possui" mermaidId="e:PROJETO-&gt;MODELO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.45;exitY=1;entryX=0.66;entryY=0;" mermaidBaseValue="possui" id="mmNIjh_8eKnvHOKM7R7M-1218">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.45;exitY=1;entryX=0.66;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-463">
            <mxGeometry relative="1" x="0.3016950775713463" as="geometry">
              <Array as="points">
                <mxPoint x="3768" y="988" />
                <mxPoint x="3363" y="988" />
                <mxPoint x="3363" y="1039" />
                <mxPoint x="3363" y="1586" />
                <mxPoint x="3363" y="1726" />
                <mxPoint x="3360" y="1726" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="origina" mermaidId="e:EXPERIMENTO-&gt;MODELO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.66;exitY=1;entryX=0.35;entryY=0;" mermaidBaseValue="origina" id="mmNIjh_8eKnvHOKM7R7M-1219">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-380" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.66;exitY=1;entryX=0.35;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-463">
            <mxGeometry relative="1" x="0.5069402200962234" as="geometry">
              <Array as="points">
                <mxPoint x="2892" y="1447" />
                <mxPoint x="3274" y="1447" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="versionado" mermaidId="e:MODELO-&gt;VERSAO_MODELO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.66;entryY=0;" mermaidBaseValue="versionado" id="mmNIjh_8eKnvHOKM7R7M-1220">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-463" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.66;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-488">
            <mxGeometry relative="1" x="-0.12802983219390907" as="geometry">
              <Array as="points">
                <mxPoint x="3317" y="2214" />
                <mxPoint x="3317" y="2483" />
                <mxPoint x="3317" y="3180" />
                <mxPoint x="3317" y="3389" />
                <mxPoint x="3317" y="3420" />
                <mxPoint x="3110" y="3420" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="empacotado" mermaidId="e:ARTEFATO_MODELO-&gt;VERSAO_MODELO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.34;entryY=0;" mermaidBaseValue="empacotado" id="mmNIjh_8eKnvHOKM7R7M-1221">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-438" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.34;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-488">
            <mxGeometry relative="1" x="-0.4329876736450796" as="geometry">
              <Array as="points">
                <mxPoint x="2923" y="3420" />
                <mxPoint x="3015" y="3420" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="avaliado" mermaidId="e:VERSAO_MODELO-&gt;AVALIACAO_MODELO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.27;exitY=1;entryX=0.66;entryY=0;" mermaidBaseValue="avaliado" id="mmNIjh_8eKnvHOKM7R7M-1222">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-488" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.27;exitY=1;entryX=0.66;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-517">
            <mxGeometry relative="1" x="0.9526659137265479" as="geometry">
              <Array as="points">
                <mxPoint x="2991" y="3778" />
                <mxPoint x="577" y="3778" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="avaliado_com" mermaidId="e:VERSAO_DATASET-&gt;AVALIACAO_MODELO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.14;exitY=1;entryX=0.34;entryY=0;" mermaidBaseValue="avaliado_com" id="mmNIjh_8eKnvHOKM7R7M-1223">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-171" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.14;exitY=1;entryX=0.34;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-517">
            <mxGeometry relative="1" x="0.29900774861867085" as="geometry">
              <Array as="points">
                <mxPoint x="1259" y="2084" />
                <mxPoint x="483" y="2084" />
                <mxPoint x="483" y="2214" />
                <mxPoint x="483" y="2483" />
                <mxPoint x="483" y="2861" />
                <mxPoint x="483" y="3389" />
                <mxPoint x="483" y="3599" />
                <mxPoint x="483" y="3808" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="disponibiliza" mermaidId="e:PROJETO-&gt;MODELO_LLM#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.75;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="disponibiliza" id="mmNIjh_8eKnvHOKM7R7M-1224">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.75;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-542">
            <mxGeometry relative="1" x="0.8329425590515764" as="geometry">
              <Array as="points">
                <mxPoint x="3843" y="908" />
                <mxPoint x="5236" y="908" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="possui" mermaidId="e:PROJETO-&gt;PROMPT#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.8;exitY=1;entryX=0.35;entryY=0;" mermaidBaseValue="possui" id="mmNIjh_8eKnvHOKM7R7M-1225">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.8;exitY=1;entryX=0.35;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-567">
            <mxGeometry relative="1" x="0.8569688544814147" as="geometry">
              <Array as="points">
                <mxPoint x="3855" y="888" />
                <mxPoint x="5493" y="888" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="cria" mermaidId="e:USUARIO-&gt;PROMPT#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.53;exitY=1;entryX=0.65;entryY=0;" mermaidBaseValue="cria" id="mmNIjh_8eKnvHOKM7R7M-1226">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.53;exitY=1;entryX=0.65;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-567">
            <mxGeometry relative="1" x="0.24950991069483686" as="geometry">
              <Array as="points">
                <mxPoint x="5281" y="509" />
                <mxPoint x="5552" y="509" />
                <mxPoint x="5552" y="539" />
                <mxPoint x="5552" y="1039" />
                <mxPoint x="5552" y="1069" />
                <mxPoint x="5568" y="1069" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="versionado" mermaidId="e:PROMPT-&gt;VERSAO_PROMPT#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="versionado" id="mmNIjh_8eKnvHOKM7R7M-1227">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-567" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-592">
            <mxGeometry relative="1" x="-0.0022734654108477192" as="geometry">
              <Array as="points" />
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="executado" mermaidId="e:VERSAO_PROMPT-&gt;EXECUCAO_PROMPT#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="executado" id="mmNIjh_8eKnvHOKM7R7M-1228">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-592" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-617">
            <mxGeometry relative="1" x="-0.15391518200762" as="geometry">
              <Array as="points">
                <mxPoint x="5530" y="2245" />
                <mxPoint x="5487" y="2245" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="atende" mermaidId="e:MODELO_LLM-&gt;EXECUCAO_PROMPT#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.27;entryY=0;" mermaidBaseValue="atende" id="mmNIjh_8eKnvHOKM7R7M-1229">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-542" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.27;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-617">
            <mxGeometry relative="1" x="-0.16465375580437125" as="geometry">
              <Array as="points">
                <mxPoint x="5236" y="1586" />
                <mxPoint x="5236" y="2214" />
                <mxPoint x="5236" y="2245" />
                <mxPoint x="5414" y="2245" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="solicita" mermaidId="e:USUARIO-&gt;EXECUCAO_PROMPT#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.6;exitY=1;entryX=0.73;entryY=0;" mermaidBaseValue="solicita" id="mmNIjh_8eKnvHOKM7R7M-1230">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.6;exitY=1;entryX=0.73;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-617">
            <mxGeometry relative="1" x="0.10508069397935338" as="geometry">
              <Array as="points">
                <mxPoint x="5299" y="489" />
                <mxPoint x="5719" y="489" />
                <mxPoint x="5719" y="539" />
                <mxPoint x="5719" y="709" />
                <mxPoint x="5719" y="1039" />
                <mxPoint x="5719" y="1586" />
                <mxPoint x="5719" y="1905" />
                <mxPoint x="5719" y="2214" />
                <mxPoint x="5719" y="2245" />
                <mxPoint x="5560" y="2245" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="possui" mermaidId="e:PROJETO-&gt;BASE_CONHECIMENTO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.09;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="possui" id="mmNIjh_8eKnvHOKM7R7M-1231">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.09;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-654">
            <mxGeometry relative="1" x="0.8224405328258801" as="geometry">
              <Array as="points">
                <mxPoint x="3681" y="848" />
                <mxPoint x="727" y="848" />
                <mxPoint x="727" y="1248" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="contem" mermaidId="e:BASE_CONHECIMENTO-&gt;DOCUMENTO_CONHECIMENTO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.66;entryY=0;" mermaidBaseValue="contem" id="mmNIjh_8eKnvHOKM7R7M-1232">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-654" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.66;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-675">
            <mxGeometry relative="1" x="-0.26328638784198233" as="geometry">
              <Array as="points">
                <mxPoint x="727" y="2124" />
                <mxPoint x="948" y="2124" />
                <mxPoint x="948" y="2214" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="fornece" mermaidId="e:VERSAO_DATASET-&gt;DOCUMENTO_CONHECIMENTO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.24;exitY=1;entryX=0.34;entryY=0;" mermaidBaseValue="fornece" id="mmNIjh_8eKnvHOKM7R7M-1233">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-171" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.24;exitY=1;entryX=0.34;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-675">
            <mxGeometry relative="1" x="0.6256191773227435" as="geometry">
              <Array as="points">
                <mxPoint x="1290" y="2104" />
                <mxPoint x="846" y="2104" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="vetorizado" mermaidId="e:DOCUMENTO_CONHECIMENTO-&gt;EMBEDDING#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="vetorizado" id="mmNIjh_8eKnvHOKM7R7M-1234">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-675" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-700">
            <mxGeometry relative="1" as="geometry">
              <Array as="points" />
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="inicia" mermaidId="e:USUARIO-&gt;CONVERSA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.82;exitY=1;entryX=0.66;entryY=0;" mermaidBaseValue="inicia" id="mmNIjh_8eKnvHOKM7R7M-1235">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.82;exitY=1;entryX=0.66;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-721">
            <mxGeometry relative="1" x="0.5486990992954608" as="geometry">
              <Array as="points">
                <mxPoint x="5350" y="429" />
                <mxPoint x="6312" y="429" />
                <mxPoint x="6312" y="539" />
                <mxPoint x="6312" y="1039" />
                <mxPoint x="6312" y="1069" />
                <mxPoint x="6329" y="1069" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="organiza" mermaidId="e:PROJETO-&gt;CONVERSA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.91;exitY=1;entryX=0.35;entryY=0;" mermaidBaseValue="organiza" id="mmNIjh_8eKnvHOKM7R7M-1236">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.91;exitY=1;entryX=0.35;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-721">
            <mxGeometry relative="1" x="0.8922123573111072" as="geometry">
              <Array as="points">
                <mxPoint x="3880" y="848" />
                <mxPoint x="6246" y="848" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="contem" mermaidId="e:CONVERSA-&gt;MENSAGEM#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.66;entryY=0;" mermaidBaseValue="contem" id="mmNIjh_8eKnvHOKM7R7M-1237">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-721" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.66;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-742">
            <mxGeometry relative="1" x="-0.1392961100820318" as="geometry">
              <Array as="points">
                <mxPoint x="6287" y="1586" />
                <mxPoint x="6287" y="1905" />
                <mxPoint x="6287" y="2483" />
                <mxPoint x="6287" y="2861" />
                <mxPoint x="6287" y="3001" />
                <mxPoint x="6016" y="3001" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="fundamenta" mermaidId="e:EXECUCAO_PROMPT-&gt;MENSAGEM#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.73;exitY=1;entryX=0.34;entryY=0;" mermaidBaseValue="fundamenta" id="mmNIjh_8eKnvHOKM7R7M-1238">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-617" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.73;exitY=1;entryX=0.34;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-742">
            <mxGeometry relative="1" x="-0.08183266932270794" as="geometry">
              <Array as="points">
                <mxPoint x="5560" y="2702" />
                <mxPoint x="5710" y="2702" />
                <mxPoint x="5710" y="3001" />
                <mxPoint x="5918" y="3001" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="possui" mermaidId="e:PROJETO-&gt;PIPELINE#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.65;exitY=1;entryX=0.35;entryY=0;" mermaidBaseValue="possui" id="mmNIjh_8eKnvHOKM7R7M-1239">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.65;exitY=1;entryX=0.35;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-767">
            <mxGeometry relative="1" x="0.7260386052395069" as="geometry">
              <Array as="points">
                <mxPoint x="3818" y="948" />
                <mxPoint x="4558" y="948" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="cria" mermaidId="e:USUARIO-&gt;PIPELINE#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.39;exitY=1;entryX=0.65;entryY=0;" mermaidBaseValue="cria" id="mmNIjh_8eKnvHOKM7R7M-1240">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.39;exitY=1;entryX=0.65;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-767">
            <mxGeometry relative="1" x="0.3258790398076843" as="geometry">
              <Array as="points">
                <mxPoint x="5247" y="469" />
                <mxPoint x="4698" y="469" />
                <mxPoint x="4698" y="539" />
                <mxPoint x="4698" y="948" />
                <mxPoint x="4617" y="948" />
                <mxPoint x="4617" y="1039" />
                <mxPoint x="4617" y="1069" />
                <mxPoint x="4634" y="1069" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="define" mermaidId="e:PIPELINE-&gt;ETAPA_PIPELINE#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="define" id="mmNIjh_8eKnvHOKM7R7M-1241">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-767" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-792">
            <mxGeometry relative="1" x="0.25650253557991154" as="geometry">
              <Array as="points">
                <mxPoint x="4558" y="1427" />
                <mxPoint x="4427" y="1427" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="executado" mermaidId="e:PIPELINE-&gt;EXECUCAO_PIPELINE#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.65;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="executado" id="mmNIjh_8eKnvHOKM7R7M-1242">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-767" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.65;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-817">
            <mxGeometry relative="1" x="0.2424544965824429" as="geometry">
              <Array as="points">
                <mxPoint x="4634" y="1427" />
                <mxPoint x="4765" y="1427" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="contem" mermaidId="e:EXECUCAO_PIPELINE-&gt;EXECUCAO_ETAPA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.34;exitY=1;entryX=0.66;entryY=0;" mermaidBaseValue="contem" id="mmNIjh_8eKnvHOKM7R7M-1243">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-817" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.34;exitY=1;entryX=0.66;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-838">
            <mxGeometry relative="1" x="-0.14851485148514854" as="geometry">
              <Array as="points">
                <mxPoint x="4715" y="2084" />
                <mxPoint x="4679" y="2084" />
                <mxPoint x="4679" y="2245" />
                <mxPoint x="4584" y="2245" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="processada" mermaidId="e:ETAPA_PIPELINE-&gt;EXECUCAO_ETAPA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.34;entryY=0;" mermaidBaseValue="processada" id="mmNIjh_8eKnvHOKM7R7M-1244">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-792" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.34;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-838">
            <mxGeometry relative="1" x="-0.19380493930514986" as="geometry">
              <Array as="points">
                <mxPoint x="4427" y="2245" />
                <mxPoint x="4485" y="2245" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="possui" mermaidId="e:PROJETO-&gt;AMBIENTE_DEPLOY#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="possui" id="mmNIjh_8eKnvHOKM7R7M-1245">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-867">
            <mxGeometry relative="1" x="0.005241105287660863" as="geometry">
              <Array as="points">
                <mxPoint x="3781" y="1008" />
                <mxPoint x="3771" y="1008" />
                <mxPoint x="3771" y="1039" />
                <mxPoint x="3771" y="1248" />
                <mxPoint x="3771" y="1905" />
                <mxPoint x="3771" y="2214" />
                <mxPoint x="3771" y="2483" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="hospeda" mermaidId="e:AMBIENTE_DEPLOY-&gt;DEPLOYMENT#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.73;entryY=0;" mermaidBaseValue="hospeda" id="mmNIjh_8eKnvHOKM7R7M-1246">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-867" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.73;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-888">
            <mxGeometry relative="1" x="-0.5101347929204898" as="geometry">
              <Array as="points">
                <mxPoint x="3771" y="3180" />
                <mxPoint x="3771" y="3599" />
                <mxPoint x="3771" y="3808" />
                <mxPoint x="3771" y="3859" />
                <mxPoint x="2834" y="3859" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="implantada" mermaidId="e:VERSAO_MODELO-&gt;DEPLOYMENT#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="implantada" id="mmNIjh_8eKnvHOKM7R7M-1247">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-488" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-888">
            <mxGeometry relative="1" x="-0.7083888761204319" as="geometry">
              <Array as="points">
                <mxPoint x="3063" y="3839" />
                <mxPoint x="2765" y="3839" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="aprova" mermaidId="e:USUARIO-&gt;DEPLOYMENT#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.11;exitY=1;entryX=0.27;entryY=0;" mermaidBaseValue="aprova" id="mmNIjh_8eKnvHOKM7R7M-1248">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.11;exitY=1;entryX=0.27;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-888">
            <mxGeometry relative="1" x="0.27770472269782576" as="geometry">
              <Array as="points">
                <mxPoint x="5178" y="389" />
                <mxPoint x="517" y="389" />
                <mxPoint x="517" y="539" />
                <mxPoint x="517" y="709" />
                <mxPoint x="517" y="1039" />
                <mxPoint x="517" y="1248" />
                <mxPoint x="517" y="1586" />
                <mxPoint x="517" y="1905" />
                <mxPoint x="517" y="2104" />
                <mxPoint x="713" y="2104" />
                <mxPoint x="713" y="2483" />
                <mxPoint x="713" y="2861" />
                <mxPoint x="713" y="3180" />
                <mxPoint x="713" y="3389" />
                <mxPoint x="713" y="3599" />
                <mxPoint x="713" y="3808" />
                <mxPoint x="713" y="3839" />
                <mxPoint x="2696" y="3839" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="expoe" mermaidId="e:DEPLOYMENT-&gt;ENDPOINT_MODELO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.27;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="expoe" id="mmNIjh_8eKnvHOKM7R7M-1249">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-888" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.27;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-917">
            <mxGeometry relative="1" x="0.706529713866471" as="geometry">
              <Array as="points">
                <mxPoint x="2696" y="4217" />
                <mxPoint x="2456" y="4217" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="rege" mermaidId="e:PROJETO-&gt;POLITICA_GOVERNANCA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.55;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="rege" id="mmNIjh_8eKnvHOKM7R7M-1250">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.55;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-938">
            <mxGeometry relative="1" x="0.05636086414491448" as="geometry">
              <Array as="points">
                <mxPoint x="3793" y="988" />
                <mxPoint x="3924" y="988" />
                <mxPoint x="3924" y="1039" />
                <mxPoint x="3924" y="1248" />
                <mxPoint x="3924" y="1586" />
                <mxPoint x="3924" y="2214" />
                <mxPoint x="3924" y="2483" />
                <mxPoint x="3924" y="2861" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="aplicada" mermaidId="e:POLITICA_GOVERNANCA-&gt;REVISAO_GOVERNANCA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="aplicada" id="mmNIjh_8eKnvHOKM7R7M-1251">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-938" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-963">
            <mxGeometry relative="1" x="-0.26392660705128634" as="geometry">
              <Array as="points">
                <mxPoint x="3924" y="3389" />
                <mxPoint x="3924" y="3808" />
                <mxPoint x="3924" y="3839" />
                <mxPoint x="4125" y="3839" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="revisada" mermaidId="e:VERSAO_MODELO-&gt;REVISAO_GOVERNANCA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.73;exitY=1;entryX=0.27;entryY=0;" mermaidBaseValue="revisada" id="mmNIjh_8eKnvHOKM7R7M-1252">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-488" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.73;exitY=1;entryX=0.27;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-963">
            <mxGeometry relative="1" x="0.4963296623125384" as="geometry">
              <Array as="points">
                <mxPoint x="3134" y="3778" />
                <mxPoint x="3853" y="3778" />
                <mxPoint x="3853" y="3859" />
                <mxPoint x="4056" y="3859" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="revisa" mermaidId="e:USUARIO-&gt;REVISAO_GOVERNANCA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.89;exitY=1;entryX=0.73;entryY=0;" mermaidBaseValue="revisa" id="mmNIjh_8eKnvHOKM7R7M-1253">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.89;exitY=1;entryX=0.73;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-963">
            <mxGeometry relative="1" x="-0.17163276656254622" as="geometry">
              <Array as="points">
                <mxPoint x="5367" y="409" />
                <mxPoint x="6441" y="409" />
                <mxPoint x="6441" y="539" />
                <mxPoint x="6441" y="709" />
                <mxPoint x="6441" y="1039" />
                <mxPoint x="6441" y="1248" />
                <mxPoint x="6441" y="1586" />
                <mxPoint x="6441" y="1905" />
                <mxPoint x="6441" y="2483" />
                <mxPoint x="6441" y="2861" />
                <mxPoint x="6441" y="3180" />
                <mxPoint x="6441" y="3389" />
                <mxPoint x="6441" y="3599" />
                <mxPoint x="6441" y="3808" />
                <mxPoint x="6441" y="3839" />
                <mxPoint x="4194" y="3839" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="medido" mermaidId="e:DEPLOYMENT-&gt;METRICA_MONITORAMENTO#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="medido" id="mmNIjh_8eKnvHOKM7R7M-1254">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-888" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-992">
            <mxGeometry relative="1" x="0.04988123515439424" as="geometry">
              <Array as="points">
                <mxPoint x="2765" y="4217" />
                <mxPoint x="2761" y="4217" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="gera" mermaidId="e:DEPLOYMENT-&gt;ALERTA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.73;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="gera" id="mmNIjh_8eKnvHOKM7R7M-1255">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-888" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.73;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-1013">
            <mxGeometry relative="1" x="0.706529713866471" as="geometry">
              <Array as="points">
                <mxPoint x="2834" y="4217" />
                <mxPoint x="3074" y="4217" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="executa" mermaidId="e:USUARIO-&gt;REGISTRO_AUDITORIA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.75;exitY=1;entryX=0.65;entryY=0;" mermaidBaseValue="executa" id="mmNIjh_8eKnvHOKM7R7M-1256">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-2" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.75;exitY=1;entryX=0.65;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-1038">
            <mxGeometry relative="1" x="0.44486578172104263" as="geometry">
              <Array as="points">
                <mxPoint x="5333" y="449" />
                <mxPoint x="6096" y="449" />
                <mxPoint x="6096" y="539" />
                <mxPoint x="6096" y="1039" />
                <mxPoint x="6096" y="1069" />
                <mxPoint x="6025" y="1069" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="registra" mermaidId="e:PROJETO-&gt;REGISTRO_AUDITORIA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.85;exitY=1;entryX=0.35;entryY=0;" mermaidBaseValue="registra" id="mmNIjh_8eKnvHOKM7R7M-1257">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.85;exitY=1;entryX=0.35;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-1038">
            <mxGeometry relative="1" x="0.8888561075706272" as="geometry">
              <Array as="points">
                <mxPoint x="3868" y="868" />
                <mxPoint x="5946" y="868" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="produz" mermaidId="e:EXECUCAO_PIPELINE-&gt;REGISTRO_LOG#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.66;exitY=1;entryX=0.34;entryY=0;" mermaidBaseValue="produz" id="mmNIjh_8eKnvHOKM7R7M-1258">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-817" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.66;exitY=1;entryX=0.34;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-1063">
            <mxGeometry relative="1" x="-0.3139719177623498" as="geometry">
              <Array as="points">
                <mxPoint x="4815" y="2214" />
                <mxPoint x="4815" y="2722" />
                <mxPoint x="4824" y="2722" />
                <mxPoint x="4824" y="2861" />
                <mxPoint x="4824" y="3001" />
                <mxPoint x="5267" y="3001" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="produz" mermaidId="e:EXECUCAO_PROMPT-&gt;REGISTRO_LOG#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.65;entryY=0;" mermaidBaseValue="produz" id="mmNIjh_8eKnvHOKM7R7M-1259">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-617" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERzeroToOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.65;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-1063">
            <mxGeometry relative="1" x="-0.25930408472012023" as="geometry">
              <Array as="points">
                <mxPoint x="5487" y="3001" />
                <mxPoint x="5366" y="3001" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="contrata" mermaidId="e:PROJETO-&gt;ASSINATURA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.6;exitY=1;entryX=0.35;entryY=0;" mermaidBaseValue="contrata" id="mmNIjh_8eKnvHOKM7R7M-1260">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-79" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.6;exitY=1;entryX=0.35;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-1105">
            <mxGeometry relative="1" x="0.5417485492039222" as="geometry">
              <Array as="points">
                <mxPoint x="3805" y="968" />
                <mxPoint x="4146" y="968" />
                <mxPoint x="4146" y="1069" />
                <mxPoint x="4149" y="1069" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="contratado" mermaidId="e:PLANO_FATURAMENTO-&gt;ASSINATURA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.65;entryY=0;" mermaidBaseValue="contratado" id="mmNIjh_8eKnvHOKM7R7M-1261">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-1088" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.5;exitY=1;entryX=0.65;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-1105">
            <mxGeometry relative="1" x="0.3805316259126734" as="geometry">
              <Array as="points">
                <mxPoint x="4414" y="968" />
                <mxPoint x="4234" y="968" />
                <mxPoint x="4234" y="1069" />
                <mxPoint x="4231" y="1069" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="contabiliza" mermaidId="e:ASSINATURA-&gt;USO_TOKEN#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.65;exitY=1;entryX=0.34;entryY=0;" mermaidBaseValue="contabiliza" id="mmNIjh_8eKnvHOKM7R7M-1262">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-1105" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.65;exitY=1;entryX=0.34;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-1130">
            <mxGeometry relative="1" x="-0.08775605733009417" as="geometry">
              <Array as="points">
                <mxPoint x="4231" y="1427" />
                <mxPoint x="4267" y="1427" />
                <mxPoint x="4267" y="1586" />
                <mxPoint x="4267" y="1905" />
                <mxPoint x="4267" y="2483" />
                <mxPoint x="4267" y="2861" />
                <mxPoint x="4267" y="3001" />
                <mxPoint x="4467" y="3001" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="consome" mermaidId="e:EXECUCAO_PROMPT-&gt;USO_TOKEN#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.27;exitY=1;entryX=0.66;entryY=0;" mermaidBaseValue="consome" id="mmNIjh_8eKnvHOKM7R7M-1263">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-617" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.27;exitY=1;entryX=0.66;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-1130">
            <mxGeometry relative="1" x="0.7162891434492289" as="geometry">
              <Array as="points">
                <mxPoint x="5414" y="2702" />
                <mxPoint x="4564" y="2702" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
        <UserObject label="fatura" mermaidId="e:ASSINATURA-&gt;FATURA#0" mermaidBaseStyle="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.5;entryY=0;" mermaidBaseValue="fatura" id="mmNIjh_8eKnvHOKM7R7M-1264">
          <mxCell edge="1" parent="mmNIjh_8eKnvHOKM7R7M-1" source="mmNIjh_8eKnvHOKM7R7M-1105" style="edgeStyle=orthogonalEdgeStyle;rounded=1;curved=0;startArrow=ERmandOne;startSize=14;endArrow=ERzeroToMany;endSize=14;jumpStyle=arc;jumpSize=12;strokeColor=#000000;strokeWidth=2;html=1;fontSize=14;labelBackgroundColor=#FFFFFF;fontFamily=Recursive;fontColor=#28253D;exitX=0.35;exitY=1;entryX=0.5;entryY=0;fontSource=https%3A%2F%2Ffonts.googleapis.com%2Fcss%3Ffamily%3DRecursive;defaultLabelBackgroundColor=page;labelPadding=0 4;" target="mmNIjh_8eKnvHOKM7R7M-1159">
            <mxGeometry relative="1" x="0.09165873771011745" as="geometry">
              <Array as="points">
                <mxPoint x="4149" y="1427" />
                <mxPoint x="4113" y="1427" />
              </Array>
            </mxGeometry>
          </mxCell>
        </UserObject>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
