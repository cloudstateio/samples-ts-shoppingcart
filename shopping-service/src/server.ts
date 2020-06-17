import cloudstate from "cloudstate"
import { service } from "./shoppingservice"

const CloudState = cloudstate.CloudState;

const server = new CloudState();
server.addEntity(service);

if (process.env.PORT) {
    server.start({ bindPort: process.env.PORT })
} else {
    server.start()
}
