# Big Data Testing

Questo repository contiene una raccolta di script e utility per eseguire test di **carico (load testing)** e gestione di servizi in ambienti **Hadoop** e **Spark**. L'obiettivo è fornire strumenti pronti all'uso per simulare carichi di lavoro e verificare la resilienza e le prestazioni del cluster.

## 📁 Struttura del Progetto

Il repository è organizzato in cartelle e script principali:

*   **`load testing H small/`**: Contiene risultati o script per test di carico di piccole dimensioni su Hadoop (es. `TestDFSIO_results.log`).
*   **`load testing spark/`**: Include script e configurazioni per eseguire test di carico specifici per Apache Spark.
*   **`createFile.sh`**: Script Bash per la generazione di file di test da utilizzare nei workload.
*   **`put_hdfsFile.sh`**: Script per caricare file generati o di test su **HDFS** (Hadoop Distributed File System).
*   **`start-hadoop-spark-services.sh`** e **`stop-hadoop-spark-services.sh`**: Utility per avviare e arrestare in sequenza tutti i servizi necessari di Hadoop e Spark.
*   **`kill-hadoop-spark-processes.sh`**: Script di "emergenza" per terminare forzatamente processi Hadoop/Spark (utile in caso di blocchi).
*   **`precondizioni.txt`**: Documento essenziale che elenca i **prerequisiti** e le condizioni necessarie per l'esecuzione corretta degli script (es. variabili d'ambiente, path, permessi).

## 🚀 Utilizzo

### 1. Prerequisiti
Prima di iniziare, **leggi attentamente il file `precondizioni.txt`**. Assicurati che:
*   Hadoop e Spark siano installati e configurati correttamente.
*   Le variabili d'ambiente (es. `HADOOP_HOME`, `SPARK_HOME`) siano impostate.
*   I servizi HDFS e YARN siano funzionanti.

### 2. Avvio dell'Ambiente
Utilizza lo script principale per avviare tutti i servizi necessari:
```bash
./start-hadoop-spark-services.sh
```

### 3. Esecuzione di un Test di Carico
Un flusso di lavoro tipico potrebbe essere:
1.  **Generare** un file di input con `createFile.sh`.
2.  **Caricare** il file su HDFS con `put_hdfsFile.sh`.
3.  **Eseguire** un test di benchmark, come quelli presenti nelle cartelle `load testing H small` o `load testing spark`.
    *   Ad esempio, per un test DFSIO su Hadoop, potresti trovare comandi o log di esempio nella relativa cartella.

### 4. Arresto e Pulizia
Al termine, ferma i servizi o, se necessario, termina i processi rimasti in esecuzione:
```bash
./stop-hadoop-spark-services.sh
# In caso di processi bloccati:
./kill-hadoop-spark-processes.sh
```

## 📊 Script Dettagliati

*   **`createFile.sh`**: Probabilmente accetta parametri come dimensione e nome del file da generare. Esamina il codice per dettagli.
*   **`put_hdfsFile.sh`**: Dovrebbe semplificare il comando `hdfs dfs -put` gestendo percorsi sorgente e destinazione.

## ⚠️ Nota
Questo repository è concepito per un ambiente di **test e sviluppo**. Usa gli script con cautela in produzione, assicurandoti di comprenderne appieno il funzionamento.
Per qualsiasi dubbio, fai riferimento ai commenti all'interno degli script e, naturalmente, al file `precondizioni.txt`. Buon testing!
