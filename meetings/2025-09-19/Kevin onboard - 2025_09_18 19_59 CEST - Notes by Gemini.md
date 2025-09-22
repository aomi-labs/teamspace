Sep 18, 2025

## Kevin onboard

Invited [Cecilia Zhang](mailto:cecilia@foameo.ai) [ksingh.consulting@gmail.com](mailto:ksingh.consulting@gmail.com)

Attachments [Kevin onboard](https://www.google.com/calendar/event?eid=aXQ1bzJmc3I0dWV0YXFsdjFkcGZoOHVhcDQgY2VjaWxpYUBmb2FtZW8uYWk) 

Meeting records [Transcript](?tab=t.ejdzvy4gzk4o) 

### Summary

Kevin Singh successfully built the CLI or L2B and was assigned by Cecilia Zhang to focus on the "codegen" part, specifically Foundry code generation, aiming to translate user intent into Forge script, while David handles contracts discovery. Cecilia emphasized minimizing external dependencies, utilizing components from the Chisel program, and outlining an application architecture with a \`codegen\` application, \`baml\` source code, and \`generated baml client\` for LLM communication. Kevin and David's work will initially be separate binaries and will eventually be merged into a single process and BAML source code file. Cecilia also recommended using Claude for development tasks, including automating repetitive work, generating design documents, and for codebase understanding, highlighting its ability to handle multiple tasks simultaneously.

### Details

* **Initial Setup and Task Assignment** Kevin Singh successfully built the CLI or L2B stuff, despite encountering some difficulties during the build process ([00:00:00](?tab=t.ejdzvy4gzk4o#heading=h.326jf3x9pgax)). Cecilia Zhang assigned Kevin to start with the "codegen" part of the project, specifically focusing on the Foundry code generation, while David handles the contracts discovery ([00:01:20](?tab=t.ejdzvy4gzk4o#heading=h.bn8ecfpsbllo)). Kevin's primary goal is to translate user intent into Forge script, leveraging existing flattened contracts, and build an API for this purpose ([00:03:33](?tab=t.ejdzvy4gzk4o#heading=h.8051c5sww6nq)).

* **Project Scope and Dependencies** Cecilia emphasized minimizing external dependencies, specifically advising against using Ethers if Foundry and Revm provide the necessary functionalities. Kevin's task involves utilizing components from the Chisel program, which is an interactive Foundry script runtime, to enable the LLM to auto-generate main functions ([00:06:56](?tab=t.ejdzvy4gzk4o#heading=h.ngpxcd8ke4h3)). The idea is to copy and paste relevant libraries like "revm interpreter" into a self-contained module within the drivers, as directly importing from a binary would be too time-consuming ([00:10:21](?tab=t.ejdzvy4gzk4o#heading=h.dl5x29aughdd)).

* **Application Architecture and LLM Integration** Cecilia outlined the application's structure, which includes a \`codegen\` application with a \`baml\` source code and \`generated baml client\`, with the \`baml infrastructure\` serving as the layer for LLM communication ([00:11:55](?tab=t.ejdzvy4gzk4o#heading=h.qgt2fhivoz5w)). She recommended referencing the discovery application design, which operates as a state machine with an LLM in the loop, to separate the "brains" (LLM) and "tools" (driver layer) of the application ([00:13:46](?tab=t.ejdzvy4gzk4o#heading=h.8nwsbxw9tty7)). The contract store will maintain an in-memory storage of contracts, which will be continually updated by the discovery application ([00:15:07](?tab=t.ejdzvy4gzk4o#heading=h.ihkngycgwofq)) ([00:17:40](?tab=t.ejdzvy4gzk4o#heading=h.ymlie7zclrof)).

* **Process Separation and Future Integration** Kevin's and David's work will initially exist as separate binaries to avoid conflicts ([00:17:40](?tab=t.ejdzvy4gzk4o#heading=h.ymlie7zclrof)). Cecilia explained that the application layer lives on top of a runtime, and eventually, their individual projects will be merged into a single process and BAML source code file, redesigning the state and binary to consolidate their functionalities ([00:19:04](?tab=t.ejdzvy4gzk4o#heading=h.e933cujrbiv4)).

* **Immediate Next Steps and Development Approach** Kevin is to start by investigating the Chisel implementation and resolving compilation issues within the provided branch, as well as studying how BAML works ([00:20:29](?tab=t.ejdzvy4gzk4o#heading=h.z62plubyp66j)). Cecilia advised an experimental approach, encouraging Kevin to focus on making the agent work first, even if it means treating it as a "toy precursor" project before full integration ([00:21:43](?tab=t.ejdzvy4gzk4o#heading=h.ljoojsn3v4yl)) ([00:29:08](?tab=t.ejdzvy4gzk4o#heading=h.5r16av8sr7ri)). The initial goal is to ensure type safety and that transactions do not revert ([00:26:30](?tab=t.ejdzvy4gzk4o#heading=h.y07zyl57xaoe)).

* **Leveraging AI Tools for Development** Cecilia strongly recommended using Claude, highlighting its effectiveness for development tasks, especially for automating repetitive work like DevOps ([00:29:08](?tab=t.ejdzvy4gzk4o#heading=h.5r16av8sr7ri)) ([00:41:01](?tab=t.ejdzvy4gzk4o#heading=h.4y9hpcwxay7k)). She demonstrated Claude's ability to handle multiple tasks simultaneously, generate design documents, and even produce accurate Docker Compose files ([00:30:20](?tab=t.ejdzvy4gzk4o#heading=h.pjqytgldq6s0)) ([00:33:49](?tab=t.ejdzvy4gzk4o#heading=h.on8gtdij3re5)). She advised using Claude by instructing it to read specific documentation and files, treating it like a human developer to manage context effectively ([00:45:27](?tab=t.ejdzvy4gzk4o#heading=h.utx41vcd7u5f)).

* **Claude's Capabilities and Limitations** Cecilia showcased how Claude helped in developing the MVP, including features like analyzing transaction history and signing transactions, but also noted its limitations in complex debugging scenarios, such as resolving front-end state issues ([00:42:13](?tab=t.ejdzvy4gzk4o#heading=h.lhqcxlydhwkm)). She highlighted that Claude can be pointed to local directories or files, and its session history is stored locally, allowing for custom command definitions and agent configurations ([00:46:25](?tab=t.ejdzvy4gzk4o#heading=h.uhhjkovxnhme)). She suggested using Claude for codebase understanding and as a project management tool by defining agents that summarize progress ([00:50:54](?tab=t.ejdzvy4gzk4o#heading=h.6hfgxsxsn7xi)).

### Suggested next steps

- [ ] Kevin Singh will start by looking into the codegen part, specifically the Foundry codegen, by building an application that separates the brains and the tools, referencing the skeleton structure Cecilia Zhang did for David.  
- [ ] Kevin Singh will learn about the two BAML folders Cecilia Zhang mentioned and design the application based on the chisel thing, resolving the compilation problem in the branch Cecilia Zhang sent.  
- [ ] Kevin Singh will look into how the entire Foundry runtime works and extract the bare minimum part for AI generation.  
- [ ] Kevin Singh will use AI, specifically Claude, to help with the work.  
- [ ] Kevin Singh will fix the compiler issue.

*You should review Gemini's notes to make sure they're accurate. [Get tips and learn how Gemini takes notes](https://support.google.com/meet/answer/14754931)*

*Please provide feedback about using Gemini to take notes in a [short survey.](https://google.qualtrics.com/jfe/form/SV_9vK3UZEaIQKKE7A?confid=rS56u5MXmdiNLkR2PriKDxIPOAIIigIgABgBCA&detailid=unspecified)*