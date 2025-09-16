## Familiarize with L2Beat
#### L2Beat
- Follow this: https://github.com/l2beat/l2beat/tree/main/packages/discovery
- Their dashboard: https://protocolbeat.l2beat.com/ui
    - [Discovery architecture](https://www.notion.so/l2b-Implementation-21036be0954d8096b398cab3b0db2837)
    - [Handlers](https://www.notion.so/Handler-Execution-on-Fields-21536be0954d80f7ab20d216b485a197)
    - [Proxy detector](https://www.notion.soProxy-Detector-1-21f36be0954d805a8c21c1a1bb397aa2?source=copy_link)
    - [l2b example output](https://www.notion.so/Example-Output-morph-21f36be0954d80a7a64fe85be3e15247?source=copy_link)

Your work starts with the artifects of running one pass of discovery: `/Users/ceciliazhang/Code/aomi/crates/drivers/eth-driver/src/handlers/projects/aave/ethereum/.flat`

### You need to do
Theses are the fecthed & flatten contract. You need to figure out how l2beat flatten it, impl that in Rust: https://github.com/l2beat/l2beat/blob/c3a1d49c07f4092914d62c65181e5fec18a88318/packages/backend/src/modules/update-monitor/DiscoveryRunner.ts#L84


## Codegen with Forge
- Go through this: https://getfoundry.sh/chisel/overview
- Run the chisel session cuz it's basically a REPL loop on top of forge. think about how chisel work. 
    - Their notes: https://github.com/foundry-rs/foundry/blob/9b3d2d79f7e5c356e20b011009a71be79e8c5a60/docs/dev/scripting.md
- We basically want this in our system [ChiselSession](https://github.com/foundry-rs/foundry/blob/11d9c1a06343d3e98dffb73c2a0618024f703b4e/crates/chisel/src/session.rs#L14)
    - llm codegen -> one session against for example `/projects/aave/ethereum/.flat`
    - assumming the flatten solitity is complete

### You need to do  

Start with this https://github.com/aomi-labs/aomi/compare/cecilia/tmp-discovery-by-claude...kevin/codegen-flat?expand=1

Look at `/crates/drivers/eth-driver/src/contract_store/mod.rs` in this branch. 

- Figure out the best structure to store & flatten contracts as the Eth-driver pull them down. When the discovery process is done, you should simumtaniously have the compiled artifacts ready, referencing L2B how to flatten their stuffs in last session.

- And then you think about codegen with LLM, to do this you need to:
    - learn baml
    - build baml function similar to this `function generateScript(string user_intent, OtherContext ctx, string source_code) -> ForgeScripts`
    - where OtherContext is filed information, price of token,...., anything the AI needs to know to do shit


