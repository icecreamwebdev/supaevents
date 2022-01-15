import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'
import { supabase } from '../utils/supabaseClient'


export default function Home({sports, leagues}) {
  return (
    <>
   <h1 className='center justify-center flex text-green-500'>my supabase app</h1>
   <div className='center flex justify-center'>
      <div className='p-3'><h2>upcoming games</h2>
        {sports.body.map((sport) => {

          return <h1>{sport.title}</h1>
        })}
      </div>
      <div className='p-3'>
      {leagues.body.map((league) => {

return <h1>{league.title}</h1>
})}
</div>
   </div>
   </>
  )
}

export async function getStaticProps(){

  const sportData = await supabase
  .from('Sport')
  .select()

  const leagueData = await supabase
  .from('League')
  .select()

 
  const sports =  await sportData
  const leagues =  await leagueData
 
  console.log(sports)
  console.log(leagues)



  return {

    props: { 
      sports,
      leagues,
    }
  }
}
