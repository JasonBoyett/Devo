import { createLazyFileRoute } from "@tanstack/react-router"
import { useQuery } from "@tanstack/react-query"
import { getVerse } from "../callers/bible"
import React from "react"

export const Route = createLazyFileRoute("/")({
  component: Index,
})

function Index() {
  const [message, setMessage] = React.useState("Loading...")
  const queary = useQuery({
    queryKey: ["data"],
    queryFn: async () =>
      await getVerse({
        book: "John",
        chapter: 3,
        start: 16,
        version: "niv",
      }),
  })

  React.useEffect(() => {
    if (queary.data) {
      setMessage("done")
    }
  }, [queary])
  return (
    <>
      <center className="p-2 min-h-screen">
        <h1 className="text-white text-7xl">Welcome to My Devo</h1>
        <p className="text-2xl">
          My Devo is devotional journaling tool meant to help you doccumet and
          sharer your time in God's word.
        </p>
        <p>{message}</p>
      </center>

      <center className="justify-end items-center text-xs">
        <div className="w-3/4">
          <p>
            We hope My Devo blesses you as you seek to grow in your relationship
            with God. Devo is a free tool and always will be. We will never
            charge for access to any features of the app, and we will never sell
            your information to third parties. We belive that the gospel is free
            and that money should never be a barrier to anything that helps you
            grow in your faith.
            <br />
            That being said, there are costs associated with running the app. If
            you feel lead to partner with this ministry we would be greatful for
            your support. Please support your local church first, but if you
            feel lead to give you can do so at the link below.
          </p>
        </div>
      </center>
    </>
  )
}
