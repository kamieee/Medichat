# 医疗问诊系统

## 快速开始指南

欢迎来到基于 **ChatGLM2   聊天GLM2** 和 **Neo4j** 的图数据库检索增强的医疗问诊系统。这是我写论文时候顺手做的一个简单的项目，因此没有特地写前后端，仅在命令行运行。以下是快速启动的步骤：

### 环境配置

1. **环境要求**：

   - Java Jdk 1.8
   - 安装步骤参考：https://www.jianshu.com/p/efef80171a4a
   - Python 3.8 以上

2. **下载 BERT 模型**：

   - 克隆 `bert-base-chinese` 模型库。
     ```bash
     git clone https://www.modelscope.cn/tiansz/bert-base-chinese.git
     ```

3. **下载 ChatGLM2 模型**：

   - 下载 `chatglm2-6B` 模型，并按照要求配置环境。
     - [chatglm2-6B 的 仓库](https://cloud.tsinghua.edu.cn/d/674208019e314311ab5c/?p=%2F&mode=list)

4. **下载 Neo4j 数据库**：

   - Neo4j 数据库推荐使用版本 `3.5.17`，以避免潜在的版本冲突。
     - [下载 Neo4j 3.5.17](https://we-yun.com/doc/neo4j/3.5.17/)

5. **安装 Neo4j 插件 APOC**：

   - 对应 `3.5.x` 版本的 Neo4j，使用以下 APOC 插件。APOC 插件可以方便的将 Json 文件导入 Neo4j 中。
     - [下载 APOC 3.5.0.15](https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/3.5.0.15)

6. **下载 DiseaseKG:基于 cnSchma 常见疾病信息知识图谱**：
   - 下载 entities.json 文件和 relations.json 文件，作为图数据库文件。
   - [下载 DiseaseKG](http://data.openkg.cn/dataset/disease-information)

### 文件放置

- 将 `bert-base-chinese`、`chatglm2-6B` 和 `neo4j` 分别放置在项目根目录下的同名文件夹中。
- 将 `entities.json` 和 `relations.json` 放入`import` 文件夹，并移动到 `neo4j` 文件夹内。
- 将 `apoc` 的 `jar` 包复制到 `neo4j` 安装目录的 `plugins` 目录下。

### Neo4j 配置

- 在 `neo4j` 配置文件 `neo4j.conf` 中添加一行以启用 APOC 插件的文件导入功能：
  ```
  apoc.import.file.enabled=true
  ```
- 在项目根目录下运行 `start_neo4j.sh` 脚本来启动 Neo4j 服务。

### 运行

- 在 配置好后，修改 cli_demo.py 中关于 ChatGLM2-6B 的设置，以便于代码能连接到您的 ChatGLM2-6B，最后通过 python cli_demo.py 启动项目
