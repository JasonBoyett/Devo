import { RouterProvider, createRouter } from "@tanstack/react-router"
import "./App.css"
import { routeTree } from "./routeTree.gen"
import { QueryClient, QueryClientProvider } from "@tanstack/react-query"

const router = createRouter({ routeTree })
const quearyClient = new QueryClient()

declare module "@tanstack/react-router" {
  interface Register {
    router: typeof router
  }
}

function App() {
  return (
    <QueryClientProvider client={quearyClient}>
      <div className="bg-gray-900 text-white">
        <RouterProvider router={router} />
      </div>
    </QueryClientProvider>
  )
}

export default App
