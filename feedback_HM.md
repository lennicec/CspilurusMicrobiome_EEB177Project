I wrote this during discussion on Tuesday, so you probably have changed it since then.

---

### The Readme

#### 1. Is the Readme file the first document displayed upon lading the Github?  Does this Readme page include a title, and the name and contact information for all project members?

Yes, the Readme is the first document displayed. There is a title and name, but not contact information.

#### 2. Is the purpose of this program clear from the Introduction?  What -in your own words- is the motivation behind the program.

The purpose is clear. The motivation is to analyze the phylogeny of bacteria from fish gut extractions.

#### 3. Is there a program workflow and is it easy to understand?  What -in your own words- is the program workflow?

Yes, there is a program workflow, but it would be easier to understand if it didn't use jargon or if the jargon was explained. It seems like the program removes low quality sequence results, and then creates phylogenies from the remaining sequencing results. I don;t know what an emperor plot is.

#### 4. Are the dependencies indicated in the workflow?  If there are Hoffman2 specific requirements are they indicated?

Yes, the dependencies are listed. Yes, Hoffman2 requirements are indicated. 

#### 5. Are there instructions for running the program?  Do the instructions make sense?  What would you do to improve the instructions?

Yes, there are instructions and they make sense. I think the instructions are good, and the commands are provided. 

#### 6. Is there a section that indicates the files and directories produced by the program?

Yes, there is a section with outputs.

#### 7. Are the research programs / motivations for the program cited?  Are the dependencies cited?

No, I don't see the motivation for the program. There are references.

---

### The Scripts

#### 8. Is there a directory that contains all of the program scripts?

Yes, there is a directory with scripts.

#### 9. Do these programs generate a run log?

N/A

---

### The Vignette

#### 10. Is there a directory called Vignette and does it include a test set, the commands used to run the program and the expected output databases?

Yes, there is a vignette directory and it includes those.

#### 11. Where you able to run the Vignette using the small test dataset? If not what errors did you get?  If so was it easy to run the dataset?  Where the instructions clear.

I tried running it, but I got some errors. I'll put them below if it helps. If I needed to install something, it wasn't clear to me from the instructions.

QIIME is caching your current deployment for improved performance. This may take a few moments and should only happen once per deployment.
Making directory called output-emp-single-end-sequences
Using sequences.fastq.gz and barcodes.fastq.gz to make emp-single-end-sequences.qza to put in output-emp-single-end-sequences directory
Usage: qiime tools import [OPTIONS]
Try "qiime tools import --help" for help.

Error: Invalid value for "--input-path": Path "emp-single-end-sequences/" does not exist.
Making directory called demultiplex-sequences
Generating demux.qza file where samples are assigned their proper sequence (goes in demultiplex-sequences directory
Usage: qiime demux emp-single [OPTIONS]
Try "qiime demux emp-single --help" for help.

Error: Invalid value for "--i-seqs": File "output-emp-single-end-sequences/emp-single-end-sequences.qza" does not exist.
Making directory called visuals
Generating a visual friendly version called demultiplex-sequences
Usage: qiime demux summarize [OPTIONS]
Try "qiime demux summarize --help" for help.


Error: Invalid value for "--i-data": File "demultiplex-sequences//demux.qza" does not exist.

#### 12. Where you able to reproduce the expected output?  If not what was different.

No, I wasn't. I got errors.

---

### General

#### 13. Give __at least two__ suggestions for ways to improve the GitHub page or the operation of the program.

I think it would be good to include the motivation/uses of the program (not just what it does). For the command that starts the master.sh file, I think it would be good to have some of those variables be provided within the program if possible, so the user wouldnt have to copy such a long thing to run it.
