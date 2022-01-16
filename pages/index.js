import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'
import { supabase } from '../utils/supabaseClient'
import { PrismaClient } from '.prisma/client'
import { getLeagues, getEvents} from '../utils/prismaQuery'


export default function Home({events}) {
  return (
    <>
   <h1 className='center justify-center flex text-green-500'>my supabase app</h1>
     {/* {events.map(event => <h1 key={event.id}>{event.eventor.title}</h1>)}  */}


      <div>
        {events.map((event) => {

            return (
              <div key={event.id}>
                <p>{event.eventors[0].title} vs {event.eventors[0].title}</p>
                <p>test</p>
              </div>
            )

        })}

      </div>
   </>
  )
}

// export async function getServerSideProps(){

//   const sportData = await supabase
//   .from('Sport')
//   .select()

//   const leagueData = await supabase
//   .from('League')
//   .select(`
//     title,
//       Sport (
//         title
//       )
//   `)

 
//   const sports =  await sportData
//   const leagues =  await leagueData
 
  
//   console.log(leagues.body[0].Sport.title)



//   return {

//     props: { 
//       sports,
//       leagues,
//     }
//   }
// }

// export async function getServerSideProps(){

//   // const data = await getLeagues()
//   const events = await getEvents()
//   const newEvents = JSON.parse(JSON.stringify(events))

//   return {
    
//   props: {

//     events: newEvents
//   }


// }
// }


export async function getServerSideProps(){

  const prisma = new PrismaClient()
  // const data = await getLeagues()
  const events = await prisma.event.findMany({include: {
    eventors: {
      select: {
        title: true,
      }, // Return all fields
  },}})
  const newEvents = JSON.parse(JSON.stringify(events))

  return {
    
  props: {

    events: newEvents
  }


}
}


